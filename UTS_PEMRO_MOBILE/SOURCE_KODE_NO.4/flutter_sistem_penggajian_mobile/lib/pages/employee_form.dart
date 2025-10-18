import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../data/db_helper.dart';
import '../utils/format.dart';

class EmployeeFormPage extends StatefulWidget {
  final Employee? employee;
  EmployeeFormPage({this.employee});

  @override
  State<EmployeeFormPage> createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends State<EmployeeFormPage> {
  final _formKey = GlobalKey<FormState>();
  final DBHelper db = DBHelper();

  late TextEditingController _nameCtrl;
  late TextEditingController _positionCtrl;
  late TextEditingController _baseCtrl;
  late TextEditingController _allowCtrl;
  late TextEditingController _deductCtrl;

  @override
  void initState() {
    super.initState();
    final e = widget.employee;
    _nameCtrl = TextEditingController(text: e?.name ?? '');
    _positionCtrl = TextEditingController(text: e?.position ?? '');
    _baseCtrl = TextEditingController(text: e != null ? e.baseSalary.toString() : '');
    _allowCtrl = TextEditingController(text: e != null ? e.allowance.toString() : '');
    _deductCtrl = TextEditingController(text: e != null ? e.deduction.toString() : '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _positionCtrl.dispose();
    _baseCtrl.dispose();
    _allowCtrl.dispose();
    _deductCtrl.dispose();
    super.dispose();
  }

  void _save() async {
    if (!_formKey.currentState!.validate()) return;
    final name = _nameCtrl.text.trim();
    final pos = _positionCtrl.text.trim();
    final base = double.tryParse(_baseCtrl.text) ?? 0;
    final allow = double.tryParse(_allowCtrl.text) ?? 0;
    final deduct = double.tryParse(_deductCtrl.text) ?? 0;

    if (widget.employee == null) {
      final e = Employee(name: name, position: pos, baseSalary: base, allowance: allow, deduction: deduct);
      await db.insertEmployee(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data ditambahkan')));
    } else {
      final e = Employee(id: widget.employee!.id, name: name, position: pos, baseSalary: base, allowance: allow, deduction: deduct);
      await db.updateEmployee(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data diperbarui')));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.employee != null;
    final total = (double.tryParse(_baseCtrl.text) ?? 0) + (double.tryParse(_allowCtrl.text) ?? 0) - (double.tryParse(_deductCtrl.text) ?? 0);

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Karyawan' : 'Tambah Karyawan')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: InputDecoration(labelText: 'Nama Karyawan'),
                validator: (v) => v == null || v.trim().isEmpty ? 'Nama wajib diisi' : null,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _positionCtrl,
                decoration: InputDecoration(labelText: 'Jabatan'),
                validator: (v) => v == null || v.trim().isEmpty ? 'Jabatan wajib diisi' : null,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _baseCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Gaji Pokok'),
                validator: (v) => v == null || v.trim().isEmpty ? 'Gaji pokok wajib diisi' : null,
                onChanged: (_) => setState(() {}),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _allowCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Tunjangan'),
                onChanged: (_) => setState(() {}),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _deductCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Potongan'),
                onChanged: (_) => setState(() {}),
              ),
              SizedBox(height: 16),
              Text('Total Gaji: ${formatCurrency(total)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              ElevatedButton.icon(
                icon: Icon(Icons.save),
                label: Text(isEdit ? 'Update' : 'Simpan'),
                onPressed: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

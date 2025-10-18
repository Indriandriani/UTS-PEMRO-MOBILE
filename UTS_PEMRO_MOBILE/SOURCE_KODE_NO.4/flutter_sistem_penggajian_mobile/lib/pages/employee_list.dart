import 'package:flutter/material.dart';
import '../data/db_helper.dart';
import '../models/employee.dart';
import 'employee_form.dart';
import 'employee_detail.dart';
import '../utils/format.dart';

class EmployeeListPage extends StatefulWidget {
  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  final DBHelper db = DBHelper();
  List<Employee> employees = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    refreshList();
  }

  Future refreshList() async {
    setState(() => loading = true);
    employees = await db.getAllEmployees();
    setState(() => loading = false);
  }

  void _delete(int id) async {
    await db.deleteEmployee(id);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data dihapus')));
    refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistem Penggajian Mobile'),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : employees.isEmpty
              ? Center(child: Text('Belum ada data. Tekan tombol + untuk menambah'))
              : ListView.builder(
                  itemCount: employees.length,
                  itemBuilder: (context, index) {
                    final e = employees[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: ListTile(
                        onTap: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (_) => EmployeeDetailPage(employee: e)));
                          refreshList();
                        },
                        title: Text(e.name),
                        subtitle: Text(e.position),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(formatCurrency(e.totalSalary)),
                            SizedBox(height: 6),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () async {
                                    await Navigator.push(context, MaterialPageRoute(builder: (_) => EmployeeFormPage(employee: e)));
                                    refreshList();
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text('Hapus'),
                                      content: Text('Yakin menghapus ${e.name}?'),
                                      actions: [
                                        TextButton(onPressed: () => Navigator.pop(context), child: Text('Batal')),
                                        TextButton(onPressed: () {
                                          Navigator.pop(context);
                                          _delete(e.id!);
                                        }, child: Text('Hapus')),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (_) => EmployeeFormPage()));
          refreshList();
        },
      ),
    );
  }
}

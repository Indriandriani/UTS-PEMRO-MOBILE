import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../db/db_helper.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _noController = TextEditingController();
  final _npmController = TextEditingController();
  final _namaController = TextEditingController();
  final _jurusanController = TextEditingController();
  Uint8List? _imageBytes;

  final dbHelper = DbHelper();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageBytes = await pickedFile.readAsBytes();
      setState(() {});
    }
  }

  void _saveData() async {
    final row = {
      'no': _noController.text,
      'npm': _npmController.text,
      'nama': _namaController.text,
      'jurusan': _jurusanController.text,
      'foto': _imageBytes,
    };
    await dbHelper.insert(row);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil disimpan!')),
    );
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: _noController, decoration: const InputDecoration(labelText: 'No.')),
              TextField(controller: _npmController, decoration: const InputDecoration(labelText: 'NPM')),
              TextField(controller: _namaController, decoration: const InputDecoration(labelText: 'Nama')),
              TextField(controller: _jurusanController, decoration: const InputDecoration(labelText: 'Jurusan')),
              const SizedBox(height: 20),
              _imageBytes == null
                  ? const Text("Belum ada foto")
                  : Image.memory(_imageBytes!, width: 100, height: 100, fit: BoxFit.cover),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text("Pilih Foto"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveData,
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

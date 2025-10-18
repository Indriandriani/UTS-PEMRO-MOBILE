import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import 'form_page.dart';

class SqlitePage extends StatefulWidget {
  const SqlitePage({super.key});

  @override
  _SqlitePageState createState() => _SqlitePageState();
}

class _SqlitePageState extends State<SqlitePage> {
  final dbHelper = DbHelper();
  List<Map<String, dynamic>> _data = [];

  void _loadData() async {
    final allData = await dbHelper.queryAll();
    setState(() {
      _data = allData;
    });
  }

  void _deleteData(int id) async {
    await dbHelper.delete(id);
    _loadData();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Mahasiswa")),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final item = _data[index];
          Uint8List? foto = item['foto'];
          return Card(
            child: ListTile(
              leading: foto != null ? Image.memory(foto, width: 50, height: 50, fit: BoxFit.cover) : const Icon(Icons.person),
              title: Text("${item['nama']} - ${item['npm']}"),
              subtitle: Text("Jurusan: ${item['jurusan']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FormPage()),
                      );
                      _loadData();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteData(item['id']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormPage()),
          );
          _loadData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'dart:typed_data';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  factory DbHelper() => _instance;

  DbHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'mahasiswa.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE mahasiswa (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            no TEXT,
            npm TEXT,
            nama TEXT,
            jurusan TEXT,
            foto BLOB
          )
        ''');
      },
    );
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('mahasiswa', row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await database;
    return await db.query('mahasiswa');
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.update('mahasiswa', row, where: 'id = ?', whereArgs: [row['id']]);
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete('mahasiswa', where: 'id = ?', whereArgs: [id]);
  }
}

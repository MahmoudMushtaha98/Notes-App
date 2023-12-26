import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDB {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await iniDB();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> iniDB() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');
    Database database =
        await openDatabase(path, onCreate: _onCreate, version: 1);
    return database;
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE NOTES(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  subTitle TEXT,
  date TEXT NOT NULL,
  time TEXT NOT NULL
)      ''');
    print('====================created');
  }

  Future<int> insertData(
      {required String title,
      required String subTitle,
      required String date,
      required String time}) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(
        "INSERT INTO NOTES(title,subTitle,date,time) VALUES ('$title','$subTitle','$date','$time')");
    return response;
  }

  Future<List<Map<String, Object?>>> readData()async{
    Database? myDb = await db;
    List<Map<String, Object?>> response = await myDb!.rawQuery('SELECT * FROM NOTES');
    return response;
  }


  Future<int> updateData(String title,String subTitle,int id)async{
    Database? myDb = await db;
    Future<int> response = myDb!.rawUpdate("UPDATE NOTES SET title = '$title', subTitle = '$subTitle' WHERE id = $id");
    return response;
  }
}

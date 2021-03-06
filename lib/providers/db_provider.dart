import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_app/models/scan_model.dart';
export 'package:qr_app/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider{
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if(_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

   Future<Database> initDB() async{
     Directory documentsDirectory = await getApplicationDocumentsDirectory();
     String path = join(documentsDirectory.path, "ScansDB.db");
   
     return await openDatabase(path, version: 1, onOpen: (db){}
      , onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Scans ("
            "id INTEGER PRIMARY KEY,"
            "tipo TEXT,"
            "valor TEXT"
            ")");
      });

   }

   Future<int?> nuevoScanRaw(ScanModel nuevoScan) async{
     final db = await database;
     final res = await db?.insert('Scans', nuevoScan.toMap());
     return res;
   }

   Future<ScanModel?> getScanById( int i) async {

     final db = await database;
    final res = await db?.query('Scans', where: 'id = ?', whereArgs: [i]);
    return res!.isNotEmpty ? ScanModel.fromMap(res.first) : null;

   }
   Future<List<ScanModel>?> getTodosScans() async {
     final db = await database;
     final res = await db?.query('Scans');
      return res!.isNotEmpty ? res.map((s)=> ScanModel.fromMap(s)).toList() : null;

   }
   Future <List<ScanModel>?> getScansPorTipo(String tipo) async {
     final db = await database;
     final res = await db?.rawQuery("SELECT * FROM Scans WHERE tipo = '$tipo'");
     return res!.isNotEmpty ? res.map((s)=> ScanModel.fromMap(s)).toList() : null;

   }

   Future<int?> updateScan(ScanModel nuevoScan) async{
     final db = await database;
     final res = await db?.update('Scans', nuevoScan.toMap(), where: 'id = ?', whereArgs: [nuevoScan.id]);
     return res;
   }

    Future<int?> deleteScan(int id) async{
      final db = await database;
      final res = await db?.delete('Scans', where: 'id = ?', whereArgs: [id]);
      return res;
    }

    Future<int?> deleteAll() async{
      final db = await database;
      final res = await db?.rawDelete('DELETE FROM Scans');
      return res;
    }



}
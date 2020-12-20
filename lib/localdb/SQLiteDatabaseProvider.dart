import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wiki_app/model/WikiModel.dart';


class SQLiteDatabaseProvider {
  SQLiteDatabaseProvider._();
  static final String tableName = "Wiki";
  static final SQLiteDatabaseProvider db = SQLiteDatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }
  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Wiki.db");
    String createTableEmployee = "CREATE TABLE $tableName ("
        "auto_id INTEGER primary key AUTOINCREMENT,"
        "title TEXT,"
        "imageUrl TEXT,"
        "description TEXT,"
        ")";
    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
          await db.execute(createTableEmployee);
        });

  }

  addPagesToDatabase(Pages result) async {
    final db = await database;
    var raw = await db.insert(
      tableName,
      result.toMapForDb(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }
  Future<List<Pages>> getAllPagesListStoredLocalDb() async {
    final db = await database;
    var response = await db.query(tableName);
    List<Pages> list =
    response.map((c) => Pages.fromJson(c)).toList();
    return list;
  }
  Future close() async => db.close();
}
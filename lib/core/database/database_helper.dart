import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'habit.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE habit(
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        created_at TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE water_logs (
        id TEXT PRIMARY KEY,
        litres REAL,
        date TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE habit_logs (
        id TEXT PRIMARY KEY,
        habit_id TEXT,
        date TEXT,
        status INTEGER, 
      )
    ''');
  }

  // INSERT
  Future<void> insertWater(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert('water_logs', data);
  }

  // GET ALL
  Future<List<Map<String, dynamic>>> getWaterLogs() async {
    final db = await database;
    return await db.query('water_logs');
  }

  void deleteWaterLogs() async {
    final db = await database;
    await db.delete('water_logs');
  }

  // GET BY DATE
  Future<List<Map<String, dynamic>>> getWaterByDate(String date) async {
    final db = await database;

    return await db.query('water_logs', where: 'date = ?', whereArgs: [date]);
  }
}

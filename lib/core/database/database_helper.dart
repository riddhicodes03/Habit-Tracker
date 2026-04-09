import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

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

  //HABIT
  //INSERT
  Future<void> insertHabit(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert('water-logs', data);
  }

  //GET
  Future<List<Map<String, dynamic>>> getHabits() async {
    final db = await database;
    return await db.query('habit');
  }

  //UPDATE
  Future<void> updateHabit(String id, int status) async {
    final db = await database;
    await db.update(
      'habit',
      {'status': status},
      where: '$id=?',
      whereArgs: [id],
    );
  }

  //DELETE
  void deleteHabit(String id) async {
    final db = await database;
    await db.delete('habit', where: '$id = ?', whereArgs: [id]);
  }

  //WATER_LOGS
  // INSERT
  Future<void> insertWater(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert('water_logs', data);
  }

  // GET
  Future<List<Map<String, dynamic>>> getWaterLogs() async {
    final db = await database;
    return await db.query('water_logs');
  }

  //DELETE
  void deleteWaterLogs(String id) async {
    final db = await database;
    await db.delete('water_logs', where: '$id = ?', whereArgs: [id]);
  }

  //UPDATE
Future<void> updateWater(Map<String, dynamic> data) async {
  final db = await database;

  await db.update(
    'water_logs',
    data,
    where: 'id = ?',
    whereArgs: [data['id']],
  );
}

  // GET BY DATE
  Future<List<Map<String, dynamic>>> getWaterByDate(String date) async {
    final db = await database;

    return await db.query('water_logs', where: 'date = ?', whereArgs: [date]);
  }

  //HABIT LOGS
  //INSERT
  Future<void> insertHabitLog(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(
      'habit_logs',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //GET LOGS BY DATE
  Future<List<Map<String, dynamic>>> getLogsByDate(String date) async {
    final db = await database;

    return await db.query('habit_logs', where: 'date = ?', whereArgs: [date]);
  }

  //GET LOGS BY ID
  Future<List<Map<String, dynamic>>> getLogsByHabit(String habitId) async {
    final db = await database;

    return await db.query(
      'habit_logs',
      where: 'habit_id = ?',
      whereArgs: [habitId],
      orderBy: 'date DESC',
    );
  }

  //Update
  Future<void> updateHabitLogs(String id, int status) async {
    final db = await database;
    await db.update(
      'habit',
      {'status': status},
      where: '$id=?',
      whereArgs: [id],
    );
  }

  //toggle
  Future<void> toggleHabit(String habitId) async {
    final db = await database;

    final today = DateTime.now().toIso8601String().split('T')[0];

    // check if log exists
    final existing = await db.query(
      'habit_logs',
      where: 'habit_id = ? AND date = ?',
      whereArgs: [habitId, today],
    );

    if (existing.isEmpty) {
      // INSERT
      await db.insert('habit_logs', {
        'id': const Uuid().v4(),
        'habit_id': habitId,
        'date': today,
        'status': 1,
      });
    } else {
      // UPDATE (toggle)
      final current = existing.first['status'] as int;

      await db.update(
        'habit_logs',
        {'status': current == 1 ? 0 : 1},
        where: 'id = ?',
        whereArgs: [existing.first['id']],
      );
    }
  }
}

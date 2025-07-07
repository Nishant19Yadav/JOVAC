import 'package:sqflite/sqflite.dart' as sqflite ;
import 'package:path/path.dart';
class TasklyDatabase {
  static final TasklyDatabase instance = TasklyDatabase._init();

  TasklyDatabase._init();

  static sqflite.Database? _database;

  Future<sqflite.Database> get database async{
    if(_database !=null) return _database!;

    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<sqflite.Database> _initDB(String filePath) async{
    final dbPath = await sqflite.getDatabasesPath();
    final path = join(dbPath, filePath);
    print('path:' + path);
    return await sqflite.openDatabase(
        path,
        version: 1,
        onCreate:_createDB
    );

  }

  Future _createDB(sqflite.Database db, int version) async{
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        date TEXT NOT NULL,
        color INTEGER NOT NULL DEFAULT 0
      )'''
    );
  }

  Future<int> addTaskly(String title, String description,String date, int color) async{
    final db = await instance.database;
    return await db.insert('tasks', {
      'title':title,
      'description':description,
      'date':date,
      'color':color
    });

  }

  Future<List<Map<String,dynamic>>> getTasks() async {
    final db = await instance.database;

    return await db.query('tasks',orderBy: 'date DESC');
  }

  Future<int> updateTask(
      String title, String description,String date, int color, int id
      ) async{
    final db = await instance.database;

    return await db.update('tasks', {
      'title':title,
      'description':description,
      'date':date,
      'color':color,
    },
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTask(int id) async{
    final db =await instance.database;

    return await db.delete('tasks', where: 'id=?',whereArgs:[id]);
  }
}
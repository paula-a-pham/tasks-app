import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasks/models/task_model/task_model.dart';

class DatabaseHelper {
  static Database? _database;
  static const int _databaseVersion = 1;
  static const String _databaseName = 'tasks.db';
  static const String _tableName = 'Tasks';

  static Future<Database?> _getDatabase() async {
    if (_database == null) {
      _database = await _initDatabase();
      return _database;
    }
    return _database;
  }

  static Future<Database?> _initDatabase() async {
    try {
      String databasesPath = await getDatabasesPath();
      String path = join(databasesPath, _databaseName);
      Database db = await openDatabase(
        path,
        version: _databaseVersion,
        onCreate: _onCreate,
      );
      if (kDebugMode) {
        print('Database open completed successfully.\n');
      }
      return db;
    } catch (error) {
      if (kDebugMode) {
        print('Database open error : $error \n');
      }
    }
    return null;
  }

  static FutureOr<void> _onCreate(db, version) async {
    try {
      await db.execute(
          'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, date TEXT, time TEXT, status INTEGER)');
      if (kDebugMode) {
        print('Database creation completed successfully.\n');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Database creation error : $error \n');
      }
    }
  }

  static Future _closeDatabase(Database db) async {
    try {
      await db.close();
      if (kDebugMode) {
        print('Database close completed successfully.\n');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Database close error : $error \n');
      }
    }
  }

  static Future<void> insertNewTask(TaskModel task) async {
    try {
      final db = await _getDatabase();
      await db!.insert(
        _tableName,
        task.toMap(),
      );
      if (kDebugMode) {
        print('Database insert completed successfully.\n');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Database insert error : $error \n');
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ReadingListProvider extends ChangeNotifier {
  Map<int, bool> readingList = {};
  Database? _database;

  Future<void> initializeDatabase() async {
    final databasesPath = await getDatabasesPath();
    final databasePath = join(databasesPath, 'reading_list.db');

    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS reading_list (id INTEGER PRIMARY KEY, album_id INTEGER, is_read BOOLEAN)',
        );
      },
    );
  }

  void updateLectureStatus(int albumNumero, bool newValue) {
    readingList[albumNumero] = newValue;
    notifyListeners();
  }
}

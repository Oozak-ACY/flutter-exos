import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ReadingListProvider extends ChangeNotifier {
  Map<int, bool> readingList = {};

  void createdb() async {
    String path = 'assets/data/bdd.db';
  }

  void updateLectureStatus(int albumNumero, bool newValue) {
    readingList[albumNumero] = newValue;
    notifyListeners();
  }
}

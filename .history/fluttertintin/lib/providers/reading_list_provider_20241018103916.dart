// reading_list_provider.dart

import 'package:flutter/material.dart';

class ReadingListProvider extends ChangeNotifier {
  Map<int, bool> readingList = {};

  void updateLectureStatus(int albumNumero, bool newValue) {
    readingList[albumNumero] = newValue;
    notifyListeners();
  }
}

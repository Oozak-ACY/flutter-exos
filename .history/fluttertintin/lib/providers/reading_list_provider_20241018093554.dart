// reading_list_provider.dart

import 'package:flutter/material.dart';

class ReadingListProvider extends ChangeNotifier {
  Map<int, bool> lectureList = {};

  void updateLectureStatus(int albumNumero, bool newValue) {
    lectureList[albumNumero] = newValue;
    notifyListeners();
  }
}

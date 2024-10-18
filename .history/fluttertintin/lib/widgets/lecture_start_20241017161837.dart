// reading_list_provider.dart

import 'package:flutter/material.dart';

class ReadingListProvider extends ChangeNotifier {
  List<Map<int, bool>> lectureList = [];

  void updateLectureStatus(int albumId, bool newValue) {
    lectureList[albumId] = newValue;
    notifyListeners();
  }
}

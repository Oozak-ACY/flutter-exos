// reading_list_provider.dart

import 'package:flutter/material.dart';

class ReadingListProvider extends ChangeNotifier {
  Map<int, bool> readingList = {};

  void addAlbum() {}

  void removeAlbum() {}

  void getAlbumByNumero() {}

  void updateLectureStatus(int albumNumero, bool newValue) {
    readingList[albumNumero] = newValue;
    notifyListeners();
  }
}

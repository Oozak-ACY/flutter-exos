import 'package:fluttertintin/models/album.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AlbumService {
  List<Album> _myAlbums = [];

  Future<List<Album>> fetchAlbums() async {
    final String jsonString =
        await rootBundle.loadString('data/albums-tintin.json');
    final data = jsonDecode(jsonString);

    _myAlbums =
        data.map<Album>((albumJson) => Album.fromJson(albumJson)).toList();

    return _myAlbums;
  }
}

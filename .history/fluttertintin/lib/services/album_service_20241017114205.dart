import 'package:fluttertintin/models/album.dart';
import 'package:flutter/material.dart';
import 'package:fluttertintin/screens/albums_master.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AlbumService {
  List<String> _albums = [];
  List<Album> _myAlbums = [];

  Future<void> generateAlbums() async {
    final fetchedAlbums = List<String>.generate(10, (i) => 'Item $i');

    _albums = fetchedAlbums;

    print(_albums);
  }

  Future<void> fetchAlbums() async {
    final String jsonString =
        await rootBundle.loadString('data/albums-tintin.json');
    final data = jsonDecode(jsonString);
    _myAlbums =
        data.map<Album>((albumJson) => Album.fromJson(albumJson)).toList();

    print(_myAlbums);
  }
}

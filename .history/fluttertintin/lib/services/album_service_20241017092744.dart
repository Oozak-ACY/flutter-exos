import 'package:fluttertintin/models/album.dart';
import 'package:flutter/material.dart';

class AlbumService extends Album {
  List<String> _albums = [];

  Future<void> generateAlbums() async {
    final fetchedAlbums = List<String>.generate(10000, (i) => 'Item $i');

    setState(() {
      _albums = fetchedAlbums;
    });

    print(_albums);
  }
}

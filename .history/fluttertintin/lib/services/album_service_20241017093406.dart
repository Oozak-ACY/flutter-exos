import 'package:fluttertintin/models/album.dart';
import 'package:flutter/material.dart';

class AlbumService extends State<Album> {
  AlbumService(String)
  List<String> _albums = [];

  Future<void> generateAlbums() async {
    final fetchedAlbums = List<String>.generate(10000, (i) => 'Item $i');

    setState(() {
      _albums = fetchedAlbums;
    });

    print(_albums);
  }
}

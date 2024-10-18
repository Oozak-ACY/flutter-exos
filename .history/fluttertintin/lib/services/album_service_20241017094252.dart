import 'package:fluttertintin/models/album.dart';
import 'package:flutter/material.dart';
import 'package:fluttertintin/screens/albums_master.dart';

class AlbumService extends Stateful<Album> {
  List<String> _albums = [];

  Future<void> generateAlbums() async {
    final fetchedAlbums = List<String>.generate(10000, (i) => 'Item $i');

    setState(() {
      _albums = fetchedAlbums;
    });

    print(_albums);
  }

  @override
  State<AlbumService> createState() => AlbumMaster();
}

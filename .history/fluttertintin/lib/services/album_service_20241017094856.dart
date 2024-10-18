import 'package:fluttertintin/models/album.dart';
import 'package:flutter/material.dart';
import 'package:fluttertintin/screens/albums_master.dart';

class AlbumService extends Album {
  AlbumService({required Album album})
      : super(
            title: album.title,
            numero: album.numero,
            year: album.year,
            yearInColor: album.yearInColor,
            image: album.image,
            resume: album.resume,
            gps: album.gps,
            location: album.location);

  List<String> _albums = [];

  Future<void> generateAlbums() async {
    final fetchedAlbums = List<String>.generate(10000, (i) => 'Item $i');

    _albums = fetchedAlbums;
    ;

    print(_albums);
  }

  @override
  State<AlbumService> createState() => AlbumMaster();
}

import 'package:fluttertintin/models/album.dart';
import 'package:flutter/material.dart';

class AlbumService extends State<Album> {
  List<Album> _albums = []; // Assuming _albums is a list of Album objects

  Future<void> generateAlbums() async {
    // Fetch album data asynchronously (replace with your actual implementation)
    final fetchedAlbums = await fetchAlbumData();

    setState(() {
      _albums = fetchedAlbums;
    });
  }
}

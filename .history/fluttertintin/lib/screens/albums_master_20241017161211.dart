import 'package:fluttertintin/models/album.dart';
import 'package:fluttertintin/services/album_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertintin/widgets/album_preview.dart';

class AlbumsMaster extends StatefulWidget {
  final String title = "Albums";

  @override
  State<AlbumsMaster> createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {
  final AlbumService _albumService = AlbumService();
  Map<int, bool> lectureList = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
      future: _albumService.fetchAlbums(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (snapshot.hasData) {
          final albums = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: ListView.builder(
                itemCount: albums.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AlbumPreview(album: albums[index]),
                  );
                },
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(child: Text('No data available')),
          );
        }
      },
    );
  }
}

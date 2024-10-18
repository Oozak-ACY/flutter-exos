import 'package:fluttertintin/models/album.dart';
import 'package:fluttertintin/services/album_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertintin/widgets/album_preview.dart';

class AlbumsDetails extends StatefulWidget {
  const AlbumsDetails({super.key, required this.album});
  final Album album;

  @override
  State<AlbumsDetails> createState() => _AlbumsDetailsState();
}

class _AlbumsDetailsState extends State<AlbumsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 255, 207),
        title: Center(
            child: Text(
          widget.album.title,
        )),
      ),
      body: Center(),
    );
  }
}

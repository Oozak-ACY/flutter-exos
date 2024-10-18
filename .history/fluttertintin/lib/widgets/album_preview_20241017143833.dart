import 'package:flutter/material.dart';
import '../models/album.dart'; // Assurez-vous d'importer votre modèle Album

class AlbumPreview extends StatelessWidget {
  final Album album;

  const AlbumPreview({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(album.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage('assets/images/${album.image}'),
        child: album.image.isEmpty
            ? const Icon(
                Icons.width_wide,
              )
            : null,
      ),
    );
  }
}

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
        backgroundImage: NetworkImage(album.image),
        child: album.image.isEmpty
            ? Icon(
                Icons.width_wide,
              )
            : null,
      ),
    );
  }
}

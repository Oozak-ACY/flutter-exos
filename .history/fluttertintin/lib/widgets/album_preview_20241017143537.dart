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
        backgroundImage: NetworkImage(album
            .imageUrl), // Assurez-vous que imageUrl est une propriété de votre modèle Album
        // Si l'image n'est pas disponible, utilisez un placeholder :
        child: album.imageUrl.isEmpty ? Icon(Icons.music_note) : null,
      ),
    );
  }
}

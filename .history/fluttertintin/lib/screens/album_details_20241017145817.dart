import 'package:flutter/material.dart';
import '../models/album.dart'; // Assurez-vous d'importer votre modèle Album

class AlbumDetails extends StatelessWidget {
  final Album album;

  const AlbumDetails({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        album.title,
        style: const TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10), // Ajuster la valeur selon vos besoins
      ),
      tileColor: const Color.fromARGB(255, 79, 68, 80),
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

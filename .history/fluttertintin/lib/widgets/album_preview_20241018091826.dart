import 'package:flutter/material.dart';
import 'package:fluttertintin/screens/album_details.dart';
import 'package:fluttertintin/widgets/reading_list_provider.dart';
import 'package:provider/provider.dart';
import '../models/album.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;

  const AlbumPreview({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    final ReadingListProvider = Provider.of<ReadingListProvider>(context);
    final isAlbumInLectureList =
        ReadingListProvider.lectureList[album.numero] ?? false;
    return ListTile(
      title: Text(
        album.title,
        style: const TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumsDetails(album: album),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertintin/screens/album_details.dart';
import 'package:fluttertintin/providers/reading_list_provider.dart';
import 'package:provider/provider.dart';
import '../models/album.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;

  const AlbumPreview({super.key, required this.album});

  void toggleLecture(int albumNumero, BuildContext context) {
    final readingListProvider =
        Provider.of<ReadingListProvider>(context, listen: false);
    bool isAlbumInLectureList =
        !(ReadingListProvider.readingListProvider[albumNumero] ?? false);
    ReadingListProvider.updateLectureStatus(
      albumNumero,
      isAlbumInLectureList,
    );
  }

  @override
  Widget build(BuildContext context) {
    final readingListProvider = Provider.of<ReadingListProvider>(context);
    final isAlbumInLectureList =
        ReadingListProvider.readingListProvider[album.numero] ?? false;
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
      trailing: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: () => toggleLecture(album.numero, context),
        tooltip: isAlbumInLectureList
            ? 'Remove from lecture list'
            : 'Add to lecture list',
        child: Icon(
          isAlbumInLectureList ? Icons.bookmark : Icons.bookmark_border,
          color: const Color.fromARGB(255, 226, 186, 241),
        ),
      ),
    );
  }
}

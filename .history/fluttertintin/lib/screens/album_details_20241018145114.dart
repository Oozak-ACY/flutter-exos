import 'package:fluttertintin/models/album.dart';
import 'package:flutter/material.dart';
import 'package:fluttertintin/providers/reading_list_provider.dart';
import 'package:provider/provider.dart';

class AlbumsDetails extends StatefulWidget {
  const AlbumsDetails({super.key, required this.album});
  final Album album;

  @override
  State<AlbumsDetails> createState() => _AlbumsDetailsState();
}

class _AlbumsDetailsState extends State<AlbumsDetails> {
  void toggleLecture(int albumNumero) {
    final readingListProvider =
        Provider.of<ReadingListProvider>(context, listen: false);
    bool isAlbumInLectureList =
        !(readingListProvider.readingList[albumNumero] ?? false);
    readingListProvider.updateLectureStatus(
      albumNumero,
      isAlbumInLectureList,
    );
  }

  @override
  Widget build(BuildContext context) {
    final readingListProvider = Provider.of<ReadingListProvider>(context);
    final isAlbumInLectureList =
        readingListProvider.readingList[widget.album.numero] ?? false;

    print(widget.album.toJson());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 24, 59),
        title: Center(
            child: Text(
          widget.album.title,
          style: const TextStyle(color: Colors.white),
        )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Text("Album n°: ${widget.album.numero}"),
              Text("Résumé: ${widget.album.resume}"),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text("Année de parution: ${widget.album.year}"),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Image.asset("assets/images/${widget.album.image}",
                      width: 500, height: 500, fit: BoxFit.contain)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleLecture(widget.album.numero),
        tooltip: isAlbumInLectureList
            ? 'Remove from lecture list'
            : 'Add to lecture list',
        child:
            Icon(isAlbumInLectureList ? Icons.bookmark : Icons.bookmark_border),
      ),
    );
  }
}

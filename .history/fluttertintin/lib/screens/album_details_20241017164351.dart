import 'package:fluttertintin/models/album.dart';
import 'package:flutter/material.dart';
import 'package:fluttertintin/widgets/lecture_start.dart';
import 'package:provider/provider.dart';

class AlbumsDetails extends StatefulWidget {
  const AlbumsDetails({super.key, required this.album});
  final Album album;

  @override
  State<AlbumsDetails> createState() => _AlbumsDetailsState();
}

class _AlbumsDetailsState extends State<AlbumsDetails> {
  ReadingListProvider get ReadingListProvider =>
      Provider.of<ReadingListProvider>(context);

  void toggleLecture(int albumNumero) {
    bool isWishList = ReadingListProvider.lectureList[albumNumero] ?? false;
    ReadingListProvider.updateLectureStatus(
      albumNumero,
      isWishList,
    );
  }

  @override
  Widget build(BuildContext context) {
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
    );
  }
}

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
          "$_counter : $typeNumberTitle",
        )),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            for (var fruit in _fruits)
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${fruit["image"]}'),
                ),
                tileColor: Color.fromARGB(
                    fruit["backgroundARGB"][0],
                    fruit["backgroundARGB"][1],
                    fruit["backgroundARGB"][2],
                    fruit["backgroundARGB"][3]),
                title: Text(
                  fruit['number'].toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () => _showAlertDialog(fruit),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _anotherFruit,
        tooltip: 'Pull another fruit',
        backgroundColor: _counter == 0
            ? const Color.fromARGB(255, 0, 255, 0)
            : const Color.fromARGB(255, 253, 174, 240),
        child: const Icon(Icons.add),
      ),
    );
  }
}

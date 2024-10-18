import 'package:fluttertintin/services/album_service.dart';
import 'package:flutter/material.dart';

class AlbumsMaster extends StatefulWidget {
  final String title = "Albums";

  @override
  State<AlbumsMaster> createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {
  AlbumService _albumService;
  void _incrementCounter() {
    _albumService.generateAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

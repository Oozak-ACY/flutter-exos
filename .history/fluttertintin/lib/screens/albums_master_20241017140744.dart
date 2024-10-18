import 'package:fluttertintin/models/album.dart';
import 'package:fluttertintin/services/album_service.dart';
import 'package:flutter/material.dart';

class AlbumsMaster extends StatefulWidget {
  final String title = "Albums";

  @override
  State<AlbumsMaster> createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {
  final AlbumService _albumService = AlbumService();
   


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(future: _albumService.fetchAlbums(), builder: (context, snapshot))
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Center(child: Text(widget.title)),
          ),
          body: Center(
            child: ListView(
              children: <Widget>[
                for (var album in _albums)
                  ListTile(
                    title: Text(""),
                  )
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

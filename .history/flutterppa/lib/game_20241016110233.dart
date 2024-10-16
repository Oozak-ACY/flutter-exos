import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.title});
  final String title;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _counter = 0;
  List<Map<String, dynamic>> _fruits = [];

  void _anotherFruit() {
    List<int> fruitBG = [];
    var fruitIMG = "";
    _incrementCounter();
    if (_counter % 2 == 0) {
      fruitBG = [255, 185, 167, 218];
      fruitIMG = 'ananas.png';
    } else {
      fruitBG = [255, 99, 199, 230];
      fruitIMG = 'poire.png';
    }
    setState(() {
      _fruits.add({
        'name': "fruit",
        'number': _counter,
        'image': 'ananas.png',
        'etat': 'nombre premier',
        'backgroundARGB': fruitBG
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            for (var fruit in _fruits)
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${fruit["image"]}'),
                ),
                tileColor: const Color.fromARGB(255, 99, 199, 230),
                title: Text(fruit['number'].toString()),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _anotherFruit,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

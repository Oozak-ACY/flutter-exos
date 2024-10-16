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
    var fruitEtat = "";
    _incrementCounter();
    if (_counter % 2 == 0) {
      fruitBG = [255, 185, 167, 218];
      fruitIMG = 'ananas.png';
      fruitEtat = 'Nombre Paire';
    } else {
      fruitBG = [255, 99, 199, 230];
      fruitIMG = 'poire.png';
      fruitEtat = 'Nombre Impaire';
    }
    setState(() {
      _fruits.add({
        'number': _counter,
        'image': fruitIMG,
        'etat': fruitEtat,
        'backgroundARGB': fruitBG
      });
    });
  }

  bool _isPrimaryNumber(double number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
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
                tileColor: Color.fromARGB(
                    fruit["backgroundARGB"][0],
                    fruit["backgroundARGB"][1],
                    fruit["backgroundARGB"][2],
                    fruit["backgroundARGB"][3]),
                title: Text(
                  fruit['number'].toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _anotherFruit,
        tooltip: 'Pull another fruit',
        child: const Icon(Icons.add),
        backgroundColor: _counter == 0
            ? const Color.fromARGB(255, 0, 255, 0)
            : const Color.fromARGB(255, 253, 174, 240),
      ),
    );
  }
}

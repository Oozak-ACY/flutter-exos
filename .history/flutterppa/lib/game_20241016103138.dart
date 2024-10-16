import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.title});
  final String title;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _counter = 0;
  List<Map<String, dynamic>> _fruit = [];

  void _anotherFruit() {
    _incrementCounter();
    _fruit.add({'name': "fruit", 'number': _counter, 'image': 'ananas.png'});
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _anotherFruit,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.title});
  final String title;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _counter = 0;
  final List<Map<String, dynamic>> _fruits = [];

  void _anotherFruit() {
    List<int> fruitBG = [];
    var fruitIMG = "";
    var fruitEtat = "";
    _incrementCounter();
    if (_counter % 2 == 0) {
      fruitBG = [255, 185, 167, 218];
      fruitIMG = 'poire.png';
      fruitEtat = 'Nombre Paire';
    } else if (_isPrimaryNumber(_counter)) {
      fruitBG = [255, 243, 75, 75];
      fruitIMG = 'ananas.png';
      fruitEtat = 'Nombre Premier';
    } else {
      fruitBG = [255, 99, 199, 230];
      fruitIMG = 'pomme.png';
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

  bool _isPrimaryNumber(int number) {
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

  String _getNumberType(int number) {
    if (_isPrimaryNumber(number)) {
      return 'Nombre Premier';
    } else if (number % 2 == 0) {
      return 'Nombre Pair';
    }
    return 'Nombre Impair';
  }

  void _deleteFruit(fruitToDelete) {
    setState(() {
      _fruits
          .removeWhere((fruit) => fruit['number'] == fruitToDelete['number']);
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _showAlertDialog(fruit) {
    showDialog(
      context:
          context, // Assurez-vous que 'context' est disponible dans votre scope
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${fruit['number']} : ${fruit['etat']}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Image.asset(
                  'images/${fruit["image"]}',
                  width: 200,
                  height: 200,
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Supprimer'),
              onPressed: () {
                _deleteFruit(fruit);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var typeNumberTitle = _getNumberType(_counter);
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

import 'package:flutter/material.dart';
import 'dart:math';

class Casino extends StatefulWidget {
  const Casino({super.key, required this.title});
  final String title;

  @override
  State<Casino> createState() => _CasinoState();
}

class _CasinoState extends State<Casino> {
  final List<String> icons = [
    'bar',
    'cerise',
    'cloche',
    'diamant',
    'fer-a-cheval',
    'pasteque',
    'sept'
  ];

  bool isWin = false;
  bool isBigWin = false;

  String result1 = 'cerise';
  String result2 = 'cloche';
  String result3 = 'sept';

  String getRandomIcon() {
    final random = Random();
    final randomIndex = random.nextInt(icons.length);
    return icons[randomIndex];
  }

  void _shuffleGame() {
    setState(() {
      result1 = getRandomIcon();
      result2 = getRandomIcon();
      result3 = getRandomIcon();

      if (result1 == result2 && result2 == result3) {
        isWin = true;
        if (result1 == "sept") {
          isBigWin = true;
        }
      } else {
        isWin = false;
        isBigWin = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isBigWin
          ? const Color.fromARGB(255, 241, 255, 113)
          : const Color.fromARGB(255, 255, 225, 220),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/$result1.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/$result2.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/$result3.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  if (isWin)
                    const Text(
                        "JACKPOT go aller voir les gentilles madames de las vegas !",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ))
                ]),
                Row(
                  children: [
                    if (isBigWin)
                      const Text(
                          "Un triple 7 équivaut à la fortune de elon musk (source fiable)",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffleGame,
        tooltip: 'Play',
        child: const Text("Play"),
      ),
    );
  }
}

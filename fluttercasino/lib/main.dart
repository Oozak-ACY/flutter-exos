import 'package:flutter/material.dart';
import 'casino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Casino',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 161, 28, 28)),
        useMaterial3: true,
      ),
      home: const Casino(title: 'Flutter Casino'),
    );
  }
}

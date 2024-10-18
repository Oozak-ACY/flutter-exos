import 'package:flutter/material.dart';
import 'package:fluttertintin/screens/albums_master.dart';
import 'package:fluttertintin/providers/reading_list_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  final readingListProvider = ReadingListProvider();
  await readingListProvider.initializeDatabase();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ReadingListProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tintin Ablums',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AlbumsMaster(),
    );
  }
}

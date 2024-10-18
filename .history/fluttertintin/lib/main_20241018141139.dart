import 'package:flutter/material.dart';
import 'package:fluttertintin/screens/albums_master.dart';
import 'package:fluttertintin/providers/reading_list_provider.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';



AppDataBase._internal() {
    // if (_database == null) database;
  }
  static final AppDataBase instance = AppDataBase._internal();

  /// sqflite datbase instance
  static Database? _database;

/// gets database instance
Future<Database> get database async {
  if (_database != null) return _database!;
  _database = await _initDB();
  return _database!;
}

/// initialize the database
Future<Database> _initDB() async {
  print('createing databse');
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'taskino.db');
  print('path is $path');
  return await openDatabase(path,
      version: 1, onCreate: _onCreate, onConfigure: _onConfigure);
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  final database = openDatabase(join(await getDatabasesPath(), 'bdd.db'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE reading_list(id INTEGER PRIMARY KEY, isMarked BOOLEAN)');
  });
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

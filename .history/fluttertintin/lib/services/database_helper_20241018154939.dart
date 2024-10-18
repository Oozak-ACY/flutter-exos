import 'package:fluttertintin/models/album.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Notes.db";
  static var databaseFactory = databaseFactoryFfi;

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE reading_list(id INTEGER PRIAMRY KEY, isMarked BOOLEAN)"),
        version: _version);
  }

  static Future<int> addReading(Album album, bool isMarked) async {
    final db = await _getDB();
    return await db.insert(
        "reading_list", {'numero': album.numero, 'isMarked': isMarked},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateReading(Album album) async {
    final db = await _getDB();
    return await db.update("reading_list", album.toJson(),
        where: 'id = ?',
        whereArgs: [album.numero],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteReading(Album album) async {
    final db = await _getDB();
    return await db
        .delete("reading_list", where: 'id = ?', whereArgs: [album.numero]);
  }

  static Future<List<Album>?> getAllReadingList() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("reading_list");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Album.fromJson(maps[index]));
  }
}

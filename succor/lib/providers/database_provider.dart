import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  String _dbName = 'succor.db';
  int _dbVersion = 1;
  static const LAST_UPDATED_TIME = 'LastUpdatedTime';
  static const PRODUCTS = 'Products';

  Database _database;

  getDatabase() async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
// Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, _dbName);

    // open the database
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute('''
      CREATE TABLE $PRODUCTS (
        id INTEGER PRIMARY KEY,
        json TEXT NOT NULL
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getAll(String table) async {
    Database database = await getDatabase();
    if (database != null) {
      return await database.rawQuery('Select * from $table');
    }
    return [];
  }

  insert(String table, entityId, json) async {
    Database database = await getDatabase();
    if (database != null) {
      String escaped = json.replaceAll("'", "''");
      database.rawInsert("REPLACE into $table(id,json) values($entityId,'$escaped')");
    }
  }
}

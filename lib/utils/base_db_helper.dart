import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BaseDbHelper {
  static final BaseDbHelper _baseDbHelper = BaseDbHelper._internal();
  final String dbName = "water_reminder.db";
  final int dbVersion = 1;

  factory BaseDbHelper() => _baseDbHelper;
  BaseDbHelper._internal();

  static Database _db;
  Future<Database> get db async {
    if (_db == null) _db = await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    var path = join(await getDatabasesPath(), dbName);
    // await deleteDatabase(path);

    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: _createDb,
    );
  }

  void _createDb(Database db, int version) async {
    await db.execute('CREATE TABLE ' +
        'drunk(id INTEGER PRIMARY KEY, ' +
        'amount INTEGER  NOT NULL, unitIndex INTEGER  NOT NULL, ' +
        'createDateUnix INTEGER NOT NULL)');
  }
}

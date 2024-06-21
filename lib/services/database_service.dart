import 'package:grocery_list/models/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instante = DatabaseService._constructor();

  final String _listTableName = "list";
  final String _listIdColumnName = "id";
  final String _listTitleColumnName = "title";
  final String _listContentColumnName = "content";
  final String _listPriceColumnName = "price";
  final String _listQuantityColumnName = "quantity";
  final String _listStatusColumnName = "status";

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $_listTableName (
          $_listIdColumnName INTEGER PRIMARY KEY,
          $_listTitleColumnName TEXT NOT NULL,
          $_listContentColumnName TEXT NOT NULL,
          $_listPriceColumnName REAL NOT NULL,
          $_listQuantityColumnName INTEGER NOT NULL,
          $_listStatusColumnName INTEGER NOT NULL
        )
        ''');
      },
    );
    return database;
  }

  void addList(String title, String content, double price, int quantity) async {
    final db = await database;
    await db.insert(
      _listTableName,
      {
        _listTitleColumnName: title,
        _listContentColumnName: content,
        _listPriceColumnName: price,
        _listQuantityColumnName: quantity,
        _listStatusColumnName: 0,
      },
    );
  }

  Future<List<Task>> getLists() async {
    final db = await database;
    final data = await db.query(_listTableName);
    List<Task> tasks = data
        .map(
          (e) => Task(
            id: e[_listIdColumnName] as int,
            title: e[_listTitleColumnName] as String,
            content: e[_listContentColumnName] as String,
            price: e[_listPriceColumnName] as double,
            quantity: e[_listQuantityColumnName] as int,
            status: e[_listStatusColumnName] as int,
          ),
        )
        .toList();
    return tasks;
  }

  void updateListStatus(int id, int status) async {
    final db = await database;
    await db.update(
      _listTableName,
      {
        _listStatusColumnName: status,
      },
      where: 'id = ?',
      whereArgs: [
        id,
      ],
    );
  }

  void deleteList(
    int id,
  ) async {
    final db = await database;
    await db.delete(
      _listTableName,
      where: 'id = ?',
      whereArgs: [
        id,
      ],
    );
  }
}

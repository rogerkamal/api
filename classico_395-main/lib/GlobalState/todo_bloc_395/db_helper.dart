import 'dart:async';
import 'dart:io';
import 'package:classico_395/GlobalState/todo_bloc_395/model/todo_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  // Singleton pattern
  // Make this a singleton class
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;
  
  // Database info
  static const _databaseName = 'todo_database.db';
  static const _databaseVersion = 1;

  // Table name
  static const table = 'todos';

  // Column names
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnDescription = 'description';
  static const columnIsCompleted = 'is_completed';
  static const columnCreatedAt = 'created_at';
  static const columnCompletedAt = 'completed_at';



  // Getter for database, initialize if not already
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // Create the database table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT NOT NULL,
        $columnDescription TEXT,
        $columnIsCompleted INTEGER NOT NULL DEFAULT 0,
        $columnCreatedAt TEXT NOT NULL,
        $columnCompletedAt TEXT
      )
    ''');
  }

  // Insert a todo into the database
  Future<bool> insertTodo({required Todo todo}) async {
    Database db = await instance.database;
    return await db.insert(table, todo.toMap()) > 0;
  }

  // Get all todos
  Future<List<Todo>> getTodos() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      table,
      orderBy: '$columnIsCompleted ASC, $columnCreatedAt DESC',
    );
    
    return List.generate(maps.length, (i) => Todo.fromMap(maps[i]));
  }

  // Get a specific todo by id
  Future<Todo?> getTodo(int id) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Todo.fromMap(maps.first);
    }
    return null;
  }

  // Update a todo
  Future<int> updateTodo(Todo todo) async {
    Database db = await instance.database;
    return await db.update(
      table,
      todo.toMap(),
      where: '$columnId = ?',
      whereArgs: [todo.id],
    );
  }

  // Toggle todo completion status
  Future<bool> toggleTodoStatus(int id, bool isCompleted) async {
    print("id: $id, isCompleted: $isCompleted");
    Database db = await instance.database;
    return await db.update(table, {
      columnIsCompleted : isCompleted ? 1 : 0
    }, where: "$columnId = ?", whereArgs: ["$id"])> 0;
  }

  // Delete a todo
  Future<int> deleteTodo(int id) async {
    Database db = await instance.database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Delete all todos
  Future<int> deleteAllTodos() async {
    Database db = await instance.database;
    return await db.delete(table);
  }

  // Close the database connection
  Future<void> close() async {
    Database db = await instance.database;
    db.close();
  }
}
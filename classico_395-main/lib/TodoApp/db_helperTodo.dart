import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelperTodo{

  DbHelperTodo._();

  static DbHelperTodo getInstance() => DbHelperTodo._();

  Database? mDB;

  ///Table Schema
  static const String TABLE_TODO = "Todo";
  static const String COLUMN_TODO_ID = "t_id";
  static const String COLUMN_TODO_TITLE = "t_title";
  static const String COLUMN_TODO_DESC = "t_desc";
  static const String COLUMN_TODO_CREATED_AT = "t_created_at";
  static const String COLUMN_TODO_PRIORITY = "t_priority";
  static const String COLUMN_TODO_IS_COMPLETED = "t_is_completed";




  Future<Database> initDB() async{
    mDB  = mDB ?? await openDB();
    return mDB!;
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "Todo.db");
    
    return openDatabase(dbPath, version: 1, onCreate: (db, version){
      db.execute("create table $TABLE_TODO ( $COLUMN_TODO_ID integer primary key autoincrement, $COLUMN_TODO_TITLE text, $COLUMN_TODO_DESC text, $COLUMN_TODO_CREATED_AT text, $COLUMN_TODO_PRIORITY integer, $COLUMN_TODO_IS_COMPLETED integer )");
    });
  }

  Future<bool> createTodo({required String title, required String desc, int isCompleted = 0, int priorityInt = 0}) async {
    var db = await initDB();

    int rowsEffected = await db.insert(TABLE_TODO, {
      COLUMN_TODO_TITLE : title,
      COLUMN_TODO_DESC : desc,
      COLUMN_TODO_IS_COMPLETED : isCompleted,
      COLUMN_TODO_PRIORITY : priorityInt,
      COLUMN_TODO_CREATED_AT : DateTime.now().millisecondsSinceEpoch.toString()
    });

    return rowsEffected>0;
  }

  /*Future<List<Map<String,dynamic>>> fetchTodo() async {
    var db = await initDB();

    List<Map<String,dynamic>> allData = await db.query(TABLE_TODO);

    return allData;
  }*/
  Future<List<Map<String,dynamic>>> fetchTodoIsCompleted({required int isCompleted}) async {
    var db = await initDB();

    List<Map<String,dynamic>> allData = await db.query(TABLE_TODO,where: "$COLUMN_TODO_IS_COMPLETED = ?",whereArgs: ['$isCompleted']);

    return allData;
  }

  Future<List<Map<String,dynamic>>> fetchTodoPriority({required int priorityInt}) async {
    var db = await initDB();

    List<Map<String,dynamic>> allData = await db.query(TABLE_TODO,where: "$COLUMN_TODO_PRIORITY = ?", whereArgs: ['$priorityInt']);

    return allData;
  }

  Future<List<Map<String,dynamic>>> fetchTodo({String query = ""}) async {
    var db = await initDB();

    List<Map<String,dynamic>> allData = await db.query(TABLE_TODO,where: "$COLUMN_TODO_TITLE LIKE ? OR $COLUMN_TODO_DESC LIKE ?",whereArgs: ["%$query%", "%$query%"]);

    return allData;
  }


  Future<bool> updateTodo({ required String title, required String desc, required int id, required int priorityInt}) async {
   var db = await initDB();

   int rowsEffected = await db.update(TABLE_TODO, {
     COLUMN_TODO_TITLE : title,
     COLUMN_TODO_DESC : desc,
     COLUMN_TODO_PRIORITY : priorityInt
   },where: "$COLUMN_TODO_ID = $id");

   return rowsEffected>0;
  }

  Future<bool> completeTodo({required int id, required int isCompleted }) async {
  var db = await initDB();
  int rowsEffected = await db.update(TABLE_TODO, {
    COLUMN_TODO_IS_COMPLETED : isCompleted
  },where: "$COLUMN_TODO_ID= ?",whereArgs: ['$id']);
  return rowsEffected>0;
}

  Future<bool> deleteTodo({required int id}) async {
    var db = await initDB();

    int rowsEffected = await db.delete(TABLE_TODO, where:"$COLUMN_TODO_ID= ?",whereArgs: ['$id']);
    return rowsEffected>0;
}

}
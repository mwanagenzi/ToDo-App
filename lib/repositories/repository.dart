import 'package:sqflite/sqflite.dart';
import 'package:todo_list_sqflite/model/category.dart';
import 'package:todo_list_sqflite/repositories/database_connection.dart';

class Repository {
  DatabaseConnection? _databaseConnection;

  Repository() {
    //initialize the database
    _databaseConnection = DatabaseConnection();
  }
  //static database variable
  static Database? _database;
  //return an instance of the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _databaseConnection!.setDatabase();
    return _database!;
  }

  insertData(table, data) async {
    //create  connection to the database
    var connection = await database;
    return await connection.insert(table, data);
  }
}
import 'dart:io';
import 'package:basketballinsider/models/bookmark_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

class DatabaseHelper{
  static final _dbName = 'bookMark1.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';
  static final columnId = 'id';
  static final siteId = 'siteId';
  static final siteTitle = 'siteTitle';
  static final siteUrl = 'siteUrl';
  static final sitePromocode = 'sitePromocode';
  static final siteRatings = 'siteRatings';
  static final siteFeature1 = 'siteFeature1';
  static final siteFeature2 = 'siteFeature2';
  static final siteFeature3 = 'siteFeature3';
  static final siteFeature4 = 'siteFeature4';
  static final siteFeature5 = 'siteFeature5';
  static final siteFeature6 = 'siteFeature6';
  static final siteLogo = 'siteLogo';
  static final siteAddedDate = 'siteAddedDate';
  static final siteCons1 = 'siteCons1';
  static final siteCons2 = 'siteCons2';
  static final siteCons3 = 'siteCons3';
  static final siteCons4 = 'siteCons4';
  static final siteCons5 = 'siteCons5';
  static final siteCons6 = 'siteCons6';
  static final siteShortDescription = 'siteShortDescription';
  static final siteLongDescrtiption = 'siteLongDescrtiption';
  static final siteBonus = 'siteBonus';
  static final siteBgImage = 'siteBgImage';


  // making it Singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async{
    if(_database != null) return _database!;

    _database = await _initiateDatabse();

    return _database!;
  }

  _initiateDatabse() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);

  }

  Future? _onCreate(Database db,int version){
    db.execute('''
    CREATE TABLE $_tableName( 
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $siteId TEXT NOT NULL,
    $siteTitle TEXT NULL,
    $siteUrl TEXT NULL,
    $sitePromocode TEXT NULL,
    $siteRatings TEXT NULL,
    $siteFeature1 TEXT NULL,
    $siteFeature2 TEXT NULL,
    $siteFeature3 TEXT NULL,
    $siteFeature4 TEXT NULL,
    $siteFeature5 TEXT NULL,
    $siteFeature6 TEXT NULL,
    $siteLogo TEXT NULL,
    $siteAddedDate TEXT NULL,
    $siteCons1 TEXT NULL,
    $siteCons2 TEXT NULL,
    $siteCons3 TEXT NULL,
    $siteCons4 TEXT NULL,
    $siteCons5 TEXT NULL,
    $siteCons6 TEXT NULL,
    $siteShortDescription TEXT NULL,
    $siteLongDescrtiption TEXT NULL,
    $siteBonus TEXT NULL,
    $siteBgImage TEXT NULL )
    '''
    );
  }

  Future<int> insert(Map<String,dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  // Future<List<Map<String,dynamic>>> queryAll() async{
  //   Database db = await instance.database;
  //   return await db.query(_tableName);
  // }

  Future<List<Value>> queryAll() async{
    Database db = await instance.database;
    final result = await db.query(_tableName);
    return result.map((json) => Value.fromJson(json)).toList();
  }

  Future<Value> readValue(int id) async{
    Database db = await instance.database;
    final maps = await db.query(_tableName,where: '$siteId=?',whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Value.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }

  }


  Future update(Map<String,dynamic> row) async{
    Database db = await instance.database;
    int? id = row[columnId];
    db.update(_tableName, row,where: '$columnId=?',whereArgs: [id]);
  }

  Future<int> delete(int id) async{
    Database db = await instance.database;
    return db.delete(_tableName,where: '$siteId=?',whereArgs: [id]);
  }


}
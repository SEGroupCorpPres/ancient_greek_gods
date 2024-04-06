import 'package:ancient_greek_gods/features/data/local/models/level_model.dart';
import 'package:ancient_greek_gods/features/data/local/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  static Database? _db;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database?> initDb() async {
    String path = await getDatabasesPath();
    try {
      return openDatabase(
        join(path, 'heroes.db'),
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE user(
            name TEXT,
            coin INTEGER,
            chance INTEGER,
            current_level INTEGER,
            completed_level INTEGER
          )
        ''');
          await db.execute('''
          CREATE TABLE level(
            level INTEGER,
            is_completed INTEGER
          )
        ''');

          await db.execute('''
          CREATE TABLE hero_list(
            name TEXT
          )
        ''');
        },
        version: 1,
      );
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        print(e.result.toString());
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future<int> insertUser(UserModel userModel) async {
    Database? dbClient = await db;
    try {
      return await dbClient!.insert(
        'user',
        {
          'name': userModel.name,
          'coin': userModel.coin,
          'chance': userModel.chance,
          'current_level': userModel.currentLevel,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        print(e.result.toString());
      }
      return 0;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return 0;
    }
  }

  Future<List<UserModel>> getUser() async {
    Database? dbClient = await db;
    List<UserModel> userList = [];
    try {
      List<Map<String, dynamic>> user = await dbClient!.query('user');
      for (var element in user) {
        UserModel userModel = UserModel.fromJson(element);
        userList.add(userModel);
      }
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        print(e.result.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return userList;
  }

  Future<List<LevelModel>> getLevel() async {
    Database? dbClient = await db;
    List<LevelModel> levelList = [];

    try {
      List<Map<String, dynamic>> levels = await dbClient!.query('level');
      for (var element in levels) {
        LevelModel levelModel = LevelModel.fromJson(element);
        levelList.add(levelModel);
      }
      return levelList;
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        print(e.result.toString());
      }
      return levelList;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return levelList;
    }
  }

  Future<List<Map<String, dynamic>>> getHeroList() async {
    Database? dbClient = await db;

    try {
      return await dbClient!.query('hero_list');
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        print(e.result.toString());
      }
      return [];
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  Future<void> updateUser(String? name, int? coin, int? chance, int? currentLevel) async {
    Database? dbClient = await db;

    try {
      if (name != null) {
        await dbClient!.update(
          'user',
          {'name': name},
        );
      } else if (coin != null) {
        await dbClient!.update(
          'user',
          {'coin': coin},
        );
      } else if (chance != null) {
        await dbClient!.update(
          'user',
          {'chance': chance},
        );
      } else if (currentLevel != null) {
        await dbClient!.update(
          'user',
          {'current_level': currentLevel},
        );
      }
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        print(e.result.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<int> insertLevel(int lvl, int isCompleted) async {
    Database? dbClient = await db;

    try {
      return await dbClient!.insert(
        'level',
        {
          'level': lvl,
          'is_completed': isCompleted,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        print(e.result.toString());
      }
      return 0;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return 0;
    }
  }

  Future<int> insertHero(String hero) async {
    Database? dbClient = await db;
    try {
      return await dbClient!.insert(
        'hero_list',
        {
          'name': hero,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        print(e.result.toString());
      }
      return 0;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return 0;
    }
  }
}

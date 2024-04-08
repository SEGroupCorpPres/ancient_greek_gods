import 'package:ancient_greek_gods/features/data/local/models/hero_model.dart';
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
            id BLOB,
            name TEXT,
            image TEXT,
            price INTEGER,
            is_equip INTEGER
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

  Future<int> insertHero(HeroModel hero) async {
    Database? dbClient = await db;
    try {
      return await dbClient!.insert(
        'hero_list',
        {
          'id': hero.id,
          'name': hero.name,
          'image': hero.image,
          'price': hero.price,
          'is_equip': hero.isEquip,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        print(e.result);
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



  Future<List<HeroModel>> getHeroList() async {
    Database? dbClient = await db;
    List<HeroModel> heroList = [];
    try {
      List<Map<String, dynamic>> hero = await dbClient!.query('hero_list');
      for (var element in hero) {
        HeroModel heroModel = HeroModel.fromJson(element);
        heroList.add(heroModel);
      }
      return heroList;
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        print(e.result.toString());
      }
      return heroList;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return heroList;
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

  Future<void> updateLevel(int level) async {
    Database? dbClient = await db;

    try {
      await dbClient!.update(
        'level',
        {'is_completed': 1},
        where: 'level = ?',
        whereArgs: [level],
      );
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

  Future<void> updateHero(int id) async {
    Database? dbClient = await db;

    try {
      await dbClient!.update(
        'hero_list',
        {'is_equip': 1},
        where: 'id = ?',
        whereArgs: [id],
      );
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
}

import 'dart:async';

import 'package:ancient_greek_gods/app/app.dart';
import 'package:ancient_greek_gods/core/helpers/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  DatabaseHelper databaseHelper = DatabaseHelper();
  await databaseHelper.db;
  runApp(const MyApp());
}

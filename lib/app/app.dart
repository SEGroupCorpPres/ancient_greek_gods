import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/presentation/pages/home_page.dart';
import '../features/presentation/pages/quiz_screen.dart';
import 'app/presentation/pages/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    // _playStopMusicOnBg();
    super.initState();
  }

  Future<void> _playStopMusicOnBg() async {
    SharedPreferences preferences = await _prefs;
    bool isSwitchedMusic = preferences.getBool('music') ?? true;
    await _player.setAsset(Assets.soundsLacrimosa);
    await _player.setLoopMode(LoopMode.all);
    if (isSwitchedMusic) {
      await _player.play();
    } else {
      await _player.stop();
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _player.dispose();
    super.dispose();
  }

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, Widget? child) {
        return CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              primaryColor: CupertinoColors.tertiarySystemBackground,
              textStyle: TextStyle(
                fontSize: 24.sp,
                fontFamily: 'Proxima',
                color: CupertinoColors.white,
                fontWeight: FontWeight.bold,
              ),
              navTitleTextStyle: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Proxima',
                color: CupertinoColors.white,
                fontWeight: FontWeight.w800,
              ),
              actionTextStyle: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Proxima',
                color: CupertinoColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor: AppColors.mainBgColor,
            brightness: Brightness.light,
            barBackgroundColor: AppColors.mainBgColor,
          ),
          home: child,
        );
      },
      // child: _userName != null ? HomePage() : EnterNameScreen(),

      child: SplashScreen(),
      // child: EnterNameScreen(),
      // child: StartGameScreen(),
      // child: HomePage(),
      // child: QuizScreen(level: 0, randomGod: 0,),
      // child: FactsScreen(isWrongAnswer: true, retryCount: 3),
      // child: NotFoundFactsScreen(),
      // child: QuizSymbolScreen(randomGod: 2,),
      // child: SettingsScreen(),
    );
  }
}

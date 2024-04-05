import 'package:ancient_greek_gods/app/app/presentation/pages/splash_screen.dart';
import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/presentation/pages/facts_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/home_page.dart';
import 'package:ancient_greek_gods/features/presentation/pages/not_found_facts_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/quiz_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/quiz_symbol_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/presentation/pages/enter_name_screen.dart';
import '../features/presentation/pages/start_game_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? _userName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkUserName();
  }
  Future<void> _checkUserName() async {
    final SharedPreferences preferences = await _prefs;
    try {
      _userName = preferences.getString('user_name');
      setState(() {});
      if (!context.mounted) return;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
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

      // child: SplashScreen(),
      // child: EnterNameScreen(),
      // child: StartGameScreen(),
      // child: HomePage(),
      // child: QuizScreen(),
      // child: FactsScreen(isWrongAnswer: true, retryCount: 3),
      // child: NotFoundFactsScreen(),
      child: QuizSymbolScreen(),
      // child: SettingsScreen(),
    );
  }
}

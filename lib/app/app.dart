import 'package:ancient_greek_gods/app/app/presentation/pages/splash_screen.dart';
import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/presentation/pages/enter_name_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/home_page.dart';
import 'package:ancient_greek_gods/features/presentation/pages/start_game_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                fontWeight: FontWeight.bold
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
      // child: SplashScreen(),
      // child: EnterNameScreen(),
      // child: StartGameScreen(),
      child: HomePage(),
    );
  }
}

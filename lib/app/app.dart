import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/presentation/pages/home_page.dart';
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
      // child: SplashScreen(),
      // child: EnterNameScreen(),
      // child: StartGameScreen(),
      child: HomePage(),
      // child: SettingsScreen(),
    );
  }
}

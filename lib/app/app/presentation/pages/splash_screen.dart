import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/core/helpers/database_helper.dart';
import 'package:ancient_greek_gods/features/data/local/models/user_model.dart';
import 'package:ancient_greek_gods/features/presentation/pages/enter_name_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/home_page.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool userExist = false;
  DatabaseHelper dbHelper = DatabaseHelper();
  String _userName = '';

  Future<void> _getUserName() async {
    List<UserModel> users = await dbHelper.getUser();
    if (users.isNotEmpty) {
      _userName = users.first.name;
    }
    setState(() {});
  }

  Future<void> _checkUserName() async {
    try {
      if (_userName.isNotEmpty) {
        userExist = true;
        setState(() {});
      } else {
        userExist = false;
        setState(() {});
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _getUserName();
    _checkUserName();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
    _animationController.animateTo(1).whenComplete(
          () => Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                builder: (_) => _userName.isNotEmpty ? const HomePage() : const EnterNameScreen(),
              ),
              (route) => false),
        );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double homeIndicatorSize = mediaQueryData.padding.bottom;
    double top = MediaQuery.of(context).padding.top;
    bool isHomeIndicator = homeIndicatorSize != 0 ? true : false;
    return CupertinoPageScaffold(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * .85,
                  child: Image.asset(
                    Assets.assetsImagesSplashBg,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: size.height - size.height * .85,
              child: Container(
                width: size.width,
                height: 110.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColors.mainBgColor, AppColors.mainBgColor.withOpacity(.0)],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40.h,
              child: SizedBox(
                width: size.width,
                child: Column(
                  children: [
                    Text(
                      'Loading'.toUpperCase(),
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 115.w, vertical: 10.h),
                      child: LinearProgressIndicator(
                        value: _animationController.value,
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(14.r),
                        minHeight: 5.h,
                        backgroundColor: AppColors.secondaryBtnBgColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

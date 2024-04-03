import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/presentation/pages/enter_name_screen.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    _animationController.animateTo(1).whenComplete(
          () => Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                builder: (_) => const EnterNameScreen(),
              ),
              (route) => false),
        );
    super.initState();
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
    return CupertinoPageScaffold(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              child: Image.asset(
                Assets.imagesSplashBg,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Text(
                  'Loading'.toUpperCase(),
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 18.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
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
            )
          ],
        ),
      ),
    );
  }
}

import 'package:ancient_greek_gods/features/presentation/pages/home_page.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/main_button.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartGameScreen extends StatefulWidget {
  const StartGameScreen({super.key});

  @override
  State<StartGameScreen> createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  child: Image.asset(
                    Assets.imagesStartPageBg,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text(
                    'uess which hero we\'re talking about and learn something new'.toUpperCase(),
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  MainButton(
                    title: 'Start Game',
                    onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (_) => const HomePage()),
                      (route) => false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

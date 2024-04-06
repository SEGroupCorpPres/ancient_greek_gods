import 'dart:math';

import 'package:ancient_greek_gods/features/data/local/data_sources/hero_about_list.dart';
import 'package:ancient_greek_gods/features/presentation/pages/not_found_facts_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/quiz_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/main_button.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FactsScreen extends StatefulWidget {
  final int level;
  final bool isWrongAnswer;
  final int retryCount;

  const FactsScreen({super.key, required this.isWrongAnswer, required this.retryCount, required this.level});

  @override
  State<FactsScreen> createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
  final int _random = Random().nextInt(9);
  int randomFact1 = Random().nextInt(18);
  int randomFact2 = Random().nextInt(18);
  int randomFact3 = Random().nextInt(18);

  void checkOldRandom() {
    if (randomFact1 == randomFact2 || randomFact2 == randomFact3 || randomFact3 == randomFact1) {
      randomFact1 = Random().nextInt(18);
      randomFact2 = Random().nextInt(18);
      randomFact3 = Random().nextInt(18);
      checkOldRandom();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkOldRandom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int random = _random;
    final Size size = MediaQuery.sizeOf(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double homeIndicatorSize = mediaQueryData.padding.bottom;
    double top = MediaQuery.of(context).padding.top;
    bool isHomeIndicator = homeIndicatorSize != 0 ? true : false;
    return CupertinoPageScaffold(
      child: SizedBox(
        height: size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Image.asset(
                  width: size.width,
                  height: isHomeIndicator ? 370.h : 440.h,
                  Assets.images3FactsScreenBg,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Positioned(
              top: top + 120.h,
              right: -10.w,
              child: Image.asset(
                Assets.godsApollo,
                width: 130.w,
              ),
            ),
            Positioned(
              top: top + 20.h,
              left: 30.w,
              child: CupertinoButton(
                pressedOpacity: 1,
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(20.r),
                child: SvgPicture.asset(
                  Assets.iconsBackBtn,
                  width: 30.w,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              bottom: 30,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  width: size.width,
                  // height: size.height * .45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          !widget.isWrongAnswer
                              ? Container()
                              : Column(
                                  children: [
                                    Text(
                                      'unfortunately you are wrong'.toUpperCase(),
                                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 30.sp, fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
                                ),
                          Text(
                            !widget.isWrongAnswer ? '3 facts'.toUpperCase() : 'new fact'.toUpperCase(),
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: !widget.isWrongAnswer ? 30.sp : 18.sp),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            heroAboutList[random]['name'].toString().toUpperCase(),
                            softWrap: true,
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            heroAboutList[random]['abouts'][randomFact1],
                            softWrap: true,
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            heroAboutList[random]['abouts'][randomFact2],
                            softWrap: true,
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            heroAboutList[random]['abouts'][randomFact3],
                            softWrap: true,
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      MainButton(
                        title: 'I Agree',
                        onPressed: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => !widget.isWrongAnswer ? QuizScreen(level: widget.level,) : NotFoundFactsScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

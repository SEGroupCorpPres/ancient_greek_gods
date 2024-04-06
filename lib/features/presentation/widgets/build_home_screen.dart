import 'package:ancient_greek_gods/features/presentation/pages/facts_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/lvl_btn.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHomeScreen extends StatefulWidget {
  const BuildHomeScreen({super.key});

  @override
  State<BuildHomeScreen> createState() => _BuildHomeScreenState();
}

class _BuildHomeScreenState extends State<BuildHomeScreen> {
  NavigatorState navigatorState(context) => Navigator.of(context, rootNavigator: true);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold  (
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              width: size.width,
              child: Image.asset(
                Assets.imagesGameLevelBg,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            top: 30,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Image.asset(
                Assets.imagesAllLevelLine,
                width: size.width * .8,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            bottom: 35.h,
            left: 15.w,
            child: LvlBtn(
              title: '1',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 1,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 65.h,
            left: 75.w,
            child: LvlBtn(
              title: '2',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 2,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 35.h,
            right: 120.w,
            child: LvlBtn(
              title: '3',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 80.h,
            right: 50.w,
            child: LvlBtn(
              title: '4',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 4,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 125.h,
            right: 105.w,
            child: LvlBtn(
              title: '5',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 5,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 130.h,
            left: 110.w,
            child: LvlBtn(
              title: '6',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 7,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 150.h,
            left: 40.w,
            child: LvlBtn(
              title: '7',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 8,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 210.h,
            left: 45.w,
            child: LvlBtn(
              title: '8',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 8,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 200.h,
            left: 120.w,
            child: LvlBtn(
              title: '9',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 9,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 215.h,
            right: 95.w,
            child: LvlBtn(
              title: '10',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 10,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 225.h,
            right: 35.w,
            child: LvlBtn(
              title: '11',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 11,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 285.h,
            right: 75.w,
            child: LvlBtn(
              title: '12',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 12,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 260.h,
            left: 135.w,
            child: LvlBtn(
              title: '13',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 13,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 270.h,
            left: 25.w,
            child: LvlBtn(
              title: '14',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 14,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 260.h,
            left: 65.w,
            child: LvlBtn(
              title: '15',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 15,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 255.h,
            left: 135.w,
            child: LvlBtn(
              title: '16',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 16,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 240.h,
            right: 95.w,
            child: LvlBtn(
              title: '17',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 17,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 260.h,
            right: 25.w,
            child: LvlBtn(
              title: '18',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 18,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 200.h,
            right: 25.w,
            child: LvlBtn(
              title: '19',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 19,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 170.h,
            right: 75.w,
            child: LvlBtn(
              title: '20',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 20,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 200.h,
            left: 125.w,
            child: LvlBtn(
              title: '21',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                      level: 21,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 190.h,
            left: 5.w,
            child: LvlBtn(
              title: '22',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 22,

                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 140.h,
            left: 22.w,
            child: LvlBtn(
              title: '23',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 23,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 155.h,
            left: 105.w,
            child: LvlBtn(
              title: '24',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                    level: 24,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 135.h,
            left: 210.w,
            child: LvlBtn(
              title: '25',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3, level: 25,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 130.h,
            right: 20.w,
            child: LvlBtn(
              title: '26',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3, level: 26,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 80.h,
            right: 10.w,
            child: LvlBtn(
              title: '27',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3, level: 27,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 80.h,
            right: 90.w,
            child: LvlBtn(
              title: '28',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3, level: 28,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 100.h,
            left: 90.w,
            child: LvlBtn(
              title: '29',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3, level: 29,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 50.h,
            child: LvlBtn(
              title: '30',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3, level: 30,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
        ],
      ),
    );
  }
}

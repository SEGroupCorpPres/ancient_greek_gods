import 'dart:io';

import 'package:ancient_greek_gods/features/presentation/widgets/lvl_btn.dart';
import 'package:ancient_greek_gods/features/presentation/pages/facts_screen.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameLevelsScreen extends StatefulWidget {
  const GameLevelsScreen({super.key});

  @override
  State<GameLevelsScreen> createState() => _GameLevelsScreenState();
}

class _GameLevelsScreenState extends State<GameLevelsScreen> {
  NavigatorState navigatorState(context) => Navigator.of(context, rootNavigator: true);

  // Size(375.0, 667.0) 8
  // Size(375.0, 667.0) se 3
  // Size(430.0, 932.0) 14 pro max
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context));
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
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
            bottom: 25.h,
            left: 5.w,
            child: LvlBtn(
              title: '1',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 50.h,
            left: 75.w,
            child: LvlBtn(
              title: '2',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 25.h,
            right: 120.w,
            child: LvlBtn(
              title: '3',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 65.h,
            right: 40.w,
            child: LvlBtn(
              title: '4',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 115.h,
            right: 105.w,
            child: LvlBtn(
              title: '5',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 120.h,
            left: 110.w,
            child: LvlBtn(
              title: '6',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 145.h,
            left: 30.w,
            child: LvlBtn(
              title: '7',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 200.h,
            left: 45.w,
            child: LvlBtn(
              title: '8',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 190.h,
            left: 120.w,
            child: LvlBtn(
              title: '9',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 195.h,
            right: 85.w,
            child: LvlBtn(
              title: '10',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 215.h,
            right: 15.w,
            child: LvlBtn(
              title: '11',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 275.h,
            right: 75.w,
            child: LvlBtn(
              title: '12',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
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
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            bottom: 270.h,
            left: 5.w,
            child: LvlBtn(
              title: '14',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 250.h,
            left: 65.w,
            child: LvlBtn(
              title: '15',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 245.h,
            left: 135.w,
            child: LvlBtn(
              title: '16',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 230.h,
            right: 75.w,
            child: LvlBtn(
              title: '17',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 250.h,
            right: 25.w,
            child: LvlBtn(
              title: '18',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 200.h,
            right: 5.w,
            child: LvlBtn(
              title: '19',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 165.h,
            right: 55.w,
            child: LvlBtn(
              title: '20',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 190.h,
            left: 125.w,
            child: LvlBtn(
              title: '21',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
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
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 130.h,
            left: 2.w,
            child: LvlBtn(
              title: '23',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 150.h,
            left: 105.w,
            child: LvlBtn(
              title: '24',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 135.h,
            left: 50.w,
            right: 0.w,
            child: LvlBtn(
              title: '25',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 120.h,
            right: 0.w,
            child: LvlBtn(
              title: '26',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 70.h,
            right: 10.w,
            child: LvlBtn(
              title: '27',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
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
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 90.h,
            left: 80.w,
            child: LvlBtn(
              title: '29',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
                  ),
                ),
              ),
              isCompleted: false,
            ),
          ),
          Positioned(
            top: 40.h,
            right: 0.w,
            left: 0.w,
            child: LvlBtn(
              title: '30',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => const FactsScreen(
                    isWrongAnswer: false,
                    retryCount: 3,
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

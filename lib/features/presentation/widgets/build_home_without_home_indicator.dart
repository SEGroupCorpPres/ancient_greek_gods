import 'package:ancient_greek_gods/features/presentation/pages/facts_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/lvl_btn.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHomeWithoutHomeIndicator extends StatefulWidget {
  const BuildHomeWithoutHomeIndicator({super.key});

  @override
  State<BuildHomeWithoutHomeIndicator> createState() => _BuildHomeWithoutHomeIndicatorState();
}

class _BuildHomeWithoutHomeIndicatorState extends State<BuildHomeWithoutHomeIndicator> {
  NavigatorState navigatorState(context) => Navigator.of(context, rootNavigator: true);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      child: SizedBox(
        height: size.height - MediaQuery.sizeOf(context).height * .1 - 10.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  Assets.imagesGameLevelBg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 30.h,
              right: 15.w,
              left: 15.w,
              top: 80.h,
              child: SizedBox(
                height: size.height * .7,
                width: size.width,
                child: Image.asset(
                  Assets.imagesAllLevelLine,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 15.h,
              left: 15.w,
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
              bottom: 45.h,
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
              bottom: 20.h,
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
              bottom: 60.h,
              right: 50.w,
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
              bottom: 105.h,
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
              bottom: 105.h,
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
              bottom: 125.h,
              left: 45.w,
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
              bottom: 190.h,
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
              bottom: 180.h,
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
              bottom: 200.h,
              right: 95.w,
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
              right: 25.w,
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
              bottom: 265.h,
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
              bottom: 245.h,
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
              bottom: 260.h,
              left: 20.w,
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
              top: 265.h,
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
              top: 260.h,
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
              top: 250.h,
              right: 85.w,
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
              top: 265.h,
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
              top: 210.h,
              right: 20.w,
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
              top: 175.h,
              right: 75.w,
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
              top: 210.h,
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
              top: 210.h,
              left: 25.w,
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
              top: 150.h,
              left: 12.w,
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
              top: 160.h,
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
              top: 145.h,
              right: 110.w,
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
              top: 140.h,
              right: 10.w,
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
              top: 90.h,
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
              top: 90.h,
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
              top: 110.h,
              left: 90.w,
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
              top: 55.h,
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
      ),
    );
  }
}

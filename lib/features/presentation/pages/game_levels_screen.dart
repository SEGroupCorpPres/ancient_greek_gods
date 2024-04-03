import 'package:ancient_greek_gods/app/app/presentation/widgets/lvl_btn.dart';
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

  @override
  Widget build(BuildContext context) {
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
            bottom: 30,
            left: 5,
            child: LvlBtn(
              title: '1',
              onPressed: () => navigatorState(context).push(
                CupertinoPageRoute(
                  builder: (context) => FactsScreen(),
                ),
              ),
              isCompleted: false,
            ),
          ),
          // Positioned(
          //   // bottom: 10,
          //   // left: 5,
          //   top: 10,
          //   child: LvlBtn(
          //     title: '2',
          //     onPressed: () {},
          //     isCompleted: false,
          //   ),
          // ),
        ],
      ),
    );
  }
}

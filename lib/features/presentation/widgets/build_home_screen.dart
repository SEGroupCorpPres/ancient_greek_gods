import 'package:ancient_greek_gods/core/helpers/database_helper.dart';
import 'package:ancient_greek_gods/features/data/local/models/level_model.dart';
import 'package:ancient_greek_gods/features/data/local/models/user_model.dart';
import 'package:ancient_greek_gods/features/presentation/pages/facts_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/lvl_btn.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHomeScreen extends StatefulWidget {
  const BuildHomeScreen({super.key});

  @override
  State<BuildHomeScreen> createState() => _BuildHomeScreenState();
}

class _BuildHomeScreenState extends State<BuildHomeScreen> {
  NavigatorState navigatorState(context) => Navigator.of(context, rootNavigator: true);
  DatabaseHelper dbHelper = DatabaseHelper();
  String userName = '';
  int currentLevel = 0;
  List<bool> isCurrentLevel = List.filled(30, false);

  Future<void> _getUserName() async {
    List<UserModel> users = await dbHelper.getUser();
    userName = users.first.name;
    currentLevel = users.first.currentLevel;
    // setState(() {});
  }

  void _checkCurrentLevel() {
    for (int i = 0; i < currentLevel; i++) {
      isCurrentLevel[i] = true;
    }
  }

  Future<List<bool>> _getLevel() async {
    List<LevelModel?> levelList = [];

    List<bool> checkLevelList = [];

    levelList = await dbHelper.getLevel();
    for (int i = 0; i < levelList.length; i++) {
      if (levelList[i]!.isCompleted != 1) {
        checkLevelList.add(false);
      } else {
        checkLevelList.add(true);
      }
    }
    return checkLevelList;
  }

  @override
  void initState() {
    // TODO: implement initState
    _getUserName();
    _checkCurrentLevel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      child: FutureBuilder(
        future: _getLevel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<bool> checkLevelList = [];
            if (snapshot.hasData) {
              checkLevelList = snapshot.data!;
              return Stack(
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
                            level: 0,
                          ),
                        ),
                      ),
                      isCompleted: checkLevelList[0],
                      isCurrent: isCurrentLevel[0],
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
                      isCompleted: checkLevelList[1],
                      isCurrent: isCurrentLevel[1],
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
                      isCompleted: checkLevelList[2],
                      isCurrent: isCurrentLevel[2],
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
                      isCompleted: checkLevelList[3],
                      isCurrent: isCurrentLevel[3],
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
                      isCompleted: checkLevelList[4],
                      isCurrent: isCurrentLevel[4],
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
                      isCompleted: checkLevelList[5],
                      isCurrent: isCurrentLevel[5],
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
                      isCompleted: checkLevelList[6],
                      isCurrent: isCurrentLevel[6],
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
                      isCompleted: checkLevelList[7],
                      isCurrent: isCurrentLevel[7],
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
                      isCompleted: checkLevelList[8],
                      isCurrent: isCurrentLevel[8],
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
                      isCompleted: checkLevelList[9],
                      isCurrent: isCurrentLevel[9],
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
                      isCompleted: checkLevelList[10],
                      isCurrent: isCurrentLevel[10],
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
                      isCompleted: checkLevelList[11],
                      isCurrent: isCurrentLevel[11],
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
                      isCompleted: checkLevelList[12],
                      isCurrent: isCurrentLevel[12],
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
                      isCompleted: checkLevelList[13],
                      isCurrent: isCurrentLevel[13],
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
                      isCompleted: checkLevelList[14],
                      isCurrent: isCurrentLevel[15],
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
                      isCompleted: checkLevelList[15],
                      isCurrent: isCurrentLevel[15],
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
                      isCompleted: checkLevelList[16],
                      isCurrent: isCurrentLevel[16],
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
                      isCompleted: checkLevelList[17],
                      isCurrent: isCurrentLevel[17],
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
                      isCompleted: checkLevelList[18],
                      isCurrent: isCurrentLevel[18],
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
                      isCompleted: checkLevelList[19],
                      isCurrent: isCurrentLevel[19],
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
                      isCompleted: checkLevelList[20],
                      isCurrent: isCurrentLevel[20],
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
                      isCompleted: checkLevelList[21],
                      isCurrent: isCurrentLevel[21],
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
                      isCompleted: checkLevelList[22],
                      isCurrent: isCurrentLevel[22],
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
                      isCompleted: checkLevelList[23],
                      isCurrent: isCurrentLevel[23],
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
                            retryCount: 3,
                            level: 25,
                          ),
                        ),
                      ),
                      isCompleted: checkLevelList[24],
                      isCurrent: isCurrentLevel[24],
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
                            retryCount: 3,
                            level: 26,
                          ),
                        ),
                      ),
                      isCompleted: checkLevelList[25],
                      isCurrent: isCurrentLevel[25],
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
                            retryCount: 3,
                            level: 27,
                          ),
                        ),
                      ),
                      isCompleted: checkLevelList[26],
                      isCurrent: isCurrentLevel[26],
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
                            level: 28,
                          ),
                        ),
                      ),
                      isCompleted: checkLevelList[27],
                      isCurrent: isCurrentLevel[27],
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
                            retryCount: 3,
                            level: 29,
                          ),
                        ),
                      ),
                      isCompleted: checkLevelList[28],
                      isCurrent: isCurrentLevel[28],
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
                            retryCount: 3,
                            level: 30,
                          ),
                        ),
                      ),
                      isCompleted: checkLevelList[29],
                      isCurrent: isCurrentLevel[29],
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}

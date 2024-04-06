import 'package:ancient_greek_gods/core/helpers/database_helper.dart';
import 'package:ancient_greek_gods/features/data/local/models/level_model.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/build_home_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/build_home_without_home_indicator.dart';
import 'package:flutter/cupertino.dart';

class GameLevelsScreen extends StatefulWidget {
  const GameLevelsScreen({
    super.key,
  });

  @override
  State<GameLevelsScreen> createState() => _GameLevelsScreenState();
}

class _GameLevelsScreenState extends State<GameLevelsScreen> {
  NavigatorState navigatorState(context) => Navigator.of(context, rootNavigator: true);
  DatabaseHelper dbHelper = DatabaseHelper();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Size(375.0, 667.0) 8
  // Size(375.0, 667.0) se 3
  // Size(414.0, 736.0) 8 +
  // Size(430.0, 932.0) 14 pro max
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double homeIndicatorSize = mediaQueryData.padding.bottom;
    final Size size = MediaQuery.sizeOf(context);


    if (homeIndicatorSize != 0) {
      return const BuildHomeScreen(
      );
    } else {
      return const BuildHomeWithoutHomeIndicator(
      );
    }
  }
}

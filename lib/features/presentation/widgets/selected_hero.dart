import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectedHero extends StatefulWidget {
  const SelectedHero({super.key});

  @override
  State<SelectedHero> createState() => _SelectedHeroState();
}

class _SelectedHeroState extends State<SelectedHero> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? _equippedHero;

  void _getEquippedHero() async {
    SharedPreferences preferences = await _prefs;
    _equippedHero = preferences.getString('equippedHero')!;
  }

  @override
  void initState() {
    // TODO: implement initState
    _getEquippedHero();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double homeIndicatorSize = mediaQueryData.padding.bottom;
    double top = MediaQuery.of(context).padding.top;
    bool isHomeIndicator = homeIndicatorSize != 0 ? true : false;
    return Positioned(
      top: top + 100.h,
      right: -10.w,
      child: _equippedHero != null
          ? Image.asset(
              'assets/images/gods/$_equippedHero.png',
              width: 130.w,
            )
          : Container(),
    );
  }
}

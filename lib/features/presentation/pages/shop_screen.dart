import 'dart:async';

import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/core/helpers/database_helper.dart';
import 'package:ancient_greek_gods/features/data/local/models/user_model.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/buy_lvl_button.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/hero_list.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final int _index = 0;
  DatabaseHelper dbHelper = DatabaseHelper();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int userCoin = 0;
  int chance = 0;
  int currentLevel = 0;

  Future<void> _getUser() async {
    List<UserModel> users = await dbHelper.getUser();
    userCoin = users.first.coin;
    chance = users.first.chance;
    currentLevel = users.first.currentLevel;
    setState(() {});
  }

  Future<void> _updateUser(int coin, int? currentLevel, int? chance) async {
    // Foydalanuvchi ma'lumotlarini yangilash
    await dbHelper.updateUser(null, coin, chance, currentLevel);
  }

  Future<void> _buyLvlOrChance(bool isLevel) async {
    if (userCoin >= 5000) {
      if (isLevel) {
        currentLevel++;
      } else {
        chance++;
      }
      setState(() {
        userCoin -= 5000;
      });
      await _updateUser(userCoin, currentLevel, chance);
    } else {
      int missingCoin = 5000 - userCoin;
      await _coinAlert(5000, missingCoin);
    }
  }

  Future<void> _buyHero(int heroPrice) async {
    if (userCoin >= heroPrice) {
      setState(() {
        userCoin -= heroPrice;
      });
      await dbHelper.updateUser(null, userCoin, null, null);
    } else {
      int missingCoin = heroPrice - userCoin;
      await _coinAlert(heroPrice, missingCoin);
    }
  }

  Future<void> _coinAlert(int coin, int missingCoin) async {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(userCoin >= coin ? 'congratulations'.toUpperCase() : 'warning'.toUpperCase()),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'not enough coins available! missing amount:'.toUpperCase(),
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: CupertinoColors.destructiveRed,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.iconsCoin,
                    width: 50.w,
                  ),
                  Text(
                    userCoin >= coin ? coin.toString().toUpperCase() : missingCoin.toString().toUpperCase(),
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            CupertinoButton(
              child: Text(
                'Ok'.toUpperCase(),
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: CupertinoColors.link,
                      fontSize: 14.sp,
                    ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        automaticallyImplyMiddle: false,
        border: const Border(),
        middle: Text(
          'Shop'.toUpperCase(),
          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
        ),
        leading: SizedBox(
          width: size.width * .3,
          child: Row(
            children: [
              Image.asset(
                Assets.iconsCoin,
                width: 20.w,
              ),
              SizedBox(width: 5.w),
              Text(
                '$userCoin'.toUpperCase(),
                style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 20.h),
                Column(
                  children: [
                    BuyLvlBtn(
                      title: 'Next level',
                      onPressed: () => _buyLvlOrChance(true),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.iconsCoin,
                            width: 20.w,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '$chance'.toUpperCase(),
                            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    BuyLvlBtn(
                      title: '50/50 chance',
                      onPressed: () => _buyLvlOrChance(false),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i <= 15; i++)
                              Container(
                                height: .1,
                                width: 5,
                                color: CupertinoColors.white,
                              ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'sages'.toUpperCase(),
                          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i <= 15; i++)
                              Container(
                                height: .2,
                                width: 5,
                                color: CupertinoColors.white,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                HeroList(size: size),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/core/helpers/database_helper.dart';
import 'package:ancient_greek_gods/features/data/local/models/hero_model.dart';
import 'package:ancient_greek_gods/features/data/local/models/user_model.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/hero_item.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeroList extends StatefulWidget {
  final Size size;

  const HeroList({super.key, required this.size});

  @override
  State<HeroList> createState() => _HeroListState();
}

class _HeroListState extends State<HeroList> {
  DatabaseHelper dbHelper = DatabaseHelper();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int userCoin = 0;

  Future<void> _getUser() async {
    List<UserModel> users = await dbHelper.getUser();
    userCoin = users.first.coin;
    setState(() {});
  }

  Future<List<HeroModel>> _getHero() async {
    List<HeroModel> heroList = await dbHelper.getHeroList();
    return heroList;
  }

  Future<void> _equipHero(String hero) async {
    SharedPreferences preferences = await _prefs;
    await preferences.setString('equippedHero', hero.toLowerCase());
    print(preferences.getString('equippedHero'));
  }

  Future<void> _buyHero(int heroPrice, int id, String hero) async {
    if (userCoin >= heroPrice) {
      setState(() {
        userCoin -= heroPrice;
      });
      await dbHelper.updateHero(
        id,
      );
    } else {
      int missingCoin = heroPrice - userCoin;
      await _coinAlert(heroPrice, missingCoin, hero);
    }
  }

  Future<void> _coinAlert(int coin, int missingCoin, String hero) async {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(userCoin >= coin ? 'congratulations'.toUpperCase() : 'warning'.toUpperCase()),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                userCoin >= coin ? 'you have purchased' : 'not enough coins available! missing amount:'.toUpperCase(),
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: CupertinoColors.destructiveRed,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !(userCoin >= coin)
                      ? Image.asset(
                          Assets.iconsCoin,
                          width: 50.w,
                        )
                      : Container(),
                  Text(
                    userCoin >= coin ? hero.toUpperCase() : missingCoin.toString().toUpperCase(),
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getHero(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            List<HeroModel> heroList = snapshot.data!;
            return Wrap(
              spacing: 20.w,
              runSpacing: 20.h,
              children: heroList.map(
                (hero) {
                  return HeroItem(
                    hero: hero,
                    size: widget.size,
                    onPressed: () {
                      if (hero.isEquip == 1) {
                        _equipHero(hero.name);
                      } else {
                        _buyHero(hero.price, hero.id, hero.name);
                      }
                    },
                  );
                },
              ).toList(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

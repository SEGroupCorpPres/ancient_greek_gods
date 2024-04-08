import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/data/local/models/hero_model.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/buy_button.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeroItem extends StatefulWidget {
  final HeroModel hero;
  final Size size;
  final VoidCallback onPressed;

  const HeroItem({super.key, required this.hero, required this.size, required this.onPressed});

  @override
  State<HeroItem> createState() => _HeroItemState();
}

class _HeroItemState extends State<HeroItem> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> _getEquippedHero() async {
    SharedPreferences preferences = await _prefs;
    String equippedHero = preferences.getString('equippedHero')!;
    return equippedHero;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getEquippedHero(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            String equippedHero = snapshot.data!;
            return SizedBox(
              width: widget.size.width * .4,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryBtnBgColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Container(
                      width: widget.size.width * .3,
                      height: widget.size.width * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.selectedBtnColor,
                        image: DecorationImage(
                          image: AssetImage(widget.hero.image),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.hero.isEquip == 1
                          ? Text(
                              'both'.toUpperCase(),
                              style: CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(
                                    color: CupertinoColors.white.withOpacity(.6),
                                    fontWeight: FontWeight.w900,
                                  ),
                            )
                          : Row(
                              children: [
                                Image.asset(
                                  Assets.iconsCoin,
                                  width: 20.w,
                                ),
                                Text(
                                  widget.hero.price.toString().toUpperCase(),
                                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                ),
                              ],
                            ),
                      !(widget.hero.name == equippedHero)
                          ? SizedBox(
                              height: 20.h,
                              width: 60.w,
                              child: BuyButton(
                                title: widget.hero.isEquip == 1 ? 'equip' : 'buy',
                                onPressed: widget.onPressed,
                              ),
                            )
                          : Text(
                              'equipped'.toUpperCase(),
                              style: CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(
                                    color: CupertinoColors.white.withOpacity(.6),
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

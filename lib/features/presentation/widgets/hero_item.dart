import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/data/local/models/hero_model.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/buy_button.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroItem extends StatelessWidget {
  final HeroModel hero;
  final Size size;

  const HeroItem({super.key, required this.hero, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .4,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondaryBtnBgColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Container(
              width: size.width * .3,
              height: size.width * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.selectedBtnColor,
                image: DecorationImage(
                  image: AssetImage(hero.image),
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
              hero.isEquip
                  ? Text(
                      'bouth'.toUpperCase(),
                      style: CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(color: CupertinoColors.white.withOpacity(.6), fontWeight: FontWeight.w900),
                    )
                  : Row(
                      children: [
                        Image.asset(
                          Assets.iconsCoin,
                          width: 20.w,
                        ),
                        Text(
                          hero.price.toUpperCase(),
                          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
              SizedBox(
                height: 20.h,
                width: 60.w,
                child: BuyButton(title: hero.isEquip ? 'equip' : 'buy', onPressed: () {}),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/buy_button.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyLvlBtn extends StatelessWidget {
  final String title;

  const BuyLvlBtn({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryBtnBgColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.iconsCoin,
                    width: 20.w,
                  ),
                  Text(
                    '5000'.toUpperCase(),
                    style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(color: AppColors.primaryColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 100.w,
            height: 50.h,
            child: BuyButton(title: 'buy', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

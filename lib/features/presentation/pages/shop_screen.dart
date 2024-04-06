import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/core/helpers/database_helper.dart';
import 'package:ancient_greek_gods/features/data/local/models/user_model.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/buy_lvl_button.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/hero_list.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _index = 0;
  DatabaseHelper dbHelper = DatabaseHelper();
  int userCoin = 0;

  Future<void> _getUser() async {
    List<UserModel> users = await dbHelper.getUser();
    userCoin = users.first.coin;
    setState(() {});
  }

  Future<void> _updateUser(int coin) async {
    // Foydalanuvchi ma'lumotlarini yangilash
    await dbHelper.updateUser(null, coin, null, null);
  }

  Future<void> _buyLvlOrChance() async {
    setState(() {
      userCoin -= 5000;
    });
    await _updateUser(userCoin);
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
                      onPressed: _buyLvlOrChance,
                    ),
                    SizedBox(height: 10.h),
                    BuyLvlBtn(
                      title: '50/50 chance',
                      onPressed: _buyLvlOrChance,
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

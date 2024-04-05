import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/settings_list_tile.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        automaticallyImplyMiddle: false,
        border: const Border(),
        middle: Text(
          'Settings'.toUpperCase(),
          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                width: size.width * .25,
                height: size.width * .25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: AppColors.selectedBtnColor,
                  image: const DecorationImage(
                    image: AssetImage(Assets.godsDionysus),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Your hero'.toUpperCase(),
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: CupertinoButton(
                color: AppColors.secondaryBtnBgColor,
                pressedOpacity: .8,
                minSize: 50.h,
                alignment: Alignment.center,
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Starscream'.toUpperCase(),
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16.sp),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              children: [
                SettingsListTile(
                  size: size,
                  title: 'Notifications',
                  trailing: Container(
                    height: 30.h,
                    width: 45.w,
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.r),
                      border: Border.all(
                        color: CupertinoColors.white.withOpacity(isSwitched ? .0 : 1),
                      ),
                    ),
                    child: CupertinoSwitch(
                      activeColor: AppColors.primaryColor,
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ),
                ),
                SettingsListTile(
                  size: size,
                  title: 'Music',
                  trailing: Container(
                    height: 30.h,
                    width: 45.w,
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.r),
                      border: Border.all(
                        color: CupertinoColors.white.withOpacity(isSwitched ? .0 : 1),
                      ),
                    ),
                    child: CupertinoSwitch(
                      activeColor: AppColors.primaryColor,
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ),
                ),
                SettingsListTile(size: size, title: 'Privacy policy'),
                SettingsListTile(size: size, title: 'Terms of Use'),
                SettingsListTile(size: size, title: 'Rate us'),
                SettingsListTile(size: size, title: 'Share app'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

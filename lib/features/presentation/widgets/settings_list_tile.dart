import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsListTile extends StatelessWidget {
  final Size size;
  final Widget? trailing;
  final String title;
  final VoidCallback? onPressed;

  const SettingsListTile({
    super.key,
    required this.size,
    this.trailing,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoListTile(
          backgroundColor: AppColors.mainBgColor,
          title: Text(
            title,
            style: CupertinoTheme.of(context).textTheme.actionTextStyle,
          ),
          trailing: trailing ??
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                child: const Icon(
                  CupertinoIcons.arrow_right,
                  color: AppColors.primaryColor,
                ),
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width - 10.w,
              margin: EdgeInsets.symmetric(vertical: 7.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i <= 45; i++)
                    Container(
                      height: .2,
                      width: 5,
                      color: CupertinoColors.white,
                    )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

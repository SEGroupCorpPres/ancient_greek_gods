import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyButton extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final VoidCallback onPressed;

  const BuyButton({
    super.key,
    this.bgColor = AppColors.primaryColor,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: bgColor,
      pressedOpacity: .8,
      alignment: Alignment.center,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16.sp),
        ),
      ),
    );
  }
}

import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final VoidCallback onPressed;

  const MainButton({
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
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0),
      alignment: Alignment.center,
      onPressed: onPressed,
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 20.sp),
        ),
      ),
    );
  }
}

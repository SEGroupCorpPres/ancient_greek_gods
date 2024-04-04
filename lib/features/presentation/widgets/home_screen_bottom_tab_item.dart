import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomTabItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;
  final Color bgColor;

  const BottomTabItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        pressedOpacity: 1,
        onPressed: onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: double.infinity,
          padding: EdgeInsets.only(top: 10.h),
          height: MediaQuery.sizeOf(context).height * .09 + 10.h,
          color: bgColor,
          child: Column(
            children: [
              SvgPicture.asset(icon),
              SizedBox(height: 10.h),
              Text(
                title.toUpperCase(),
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16.sp),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

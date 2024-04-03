import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizAnswerBtn extends StatelessWidget {
  final Size size;
  final String title;
  final bool? isSelected;
  final bool? isCorrect;
  final Color? bgColor;
  final VoidCallback onPressed;

  const QuizAnswerBtn({
    super.key,
    required this.size,
    required this.title,
    this.isSelected = false,
    this.isCorrect = false,
    this.bgColor = AppColors.selectedBtnColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: size.width * .4,
      decoration: BoxDecoration(
        border: Border.all(color: CupertinoColors.white.withOpacity(isSelected! ? 1 : .0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
        onPressed: onPressed,
        color: isCorrect! ? AppColors.primaryColor : bgColor,
        child: Text(
          title.toUpperCase(),
          style: CupertinoTheme
              .of(context)
              .textTheme
              .textStyle
              .copyWith(
            fontSize: 18.sp,
            color: CupertinoColors.white.withOpacity(
              isSelected! ? .5 : 1,
            ),
          ),
        ),
      ),
    );
  }
}

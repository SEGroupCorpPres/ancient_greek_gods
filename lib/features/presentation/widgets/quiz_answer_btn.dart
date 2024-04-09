import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizAnswerBtn extends StatefulWidget {
  final Size size;
  final String title;
  final bool? isSelected;
  final bool? isCorrect;
  final Color? bgColor;
  final bool? isWrong;
  final VoidCallback onPressed;

  const QuizAnswerBtn({
    super.key,
    required this.size,
    required this.title,
    this.isSelected = false,
    this.isCorrect,
    this.isWrong = false,
    this.bgColor,
    required this.onPressed,
  });

  @override
  State<QuizAnswerBtn> createState() => _QuizAnswerBtnState();
}

class _QuizAnswerBtnState extends State<QuizAnswerBtn> {
  Color getButtonColor() {
    if (widget.isSelected!) {
      if (widget.isCorrect == null) {
        return AppColors.selectedBtnColor;
      } else {
        if (widget.isCorrect!) {
          return CupertinoColors.activeGreen; // Set green color for selected correct answer button
        } else {
          return CupertinoColors.destructiveRed; // Set red color for selected incorrect answer button
        }
      }
    } else {
      if (widget.isCorrect != null) {
        if (widget.isCorrect!) {
          return CupertinoColors.activeGreen;
        }
      }
      return AppColors.secondaryBtnBgColor; // Default color for unselected buttons
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: widget.size.width * .4,
      height: 55.h,
      decoration: BoxDecoration(
        border: Border.all(color: CupertinoColors.white.withOpacity(widget.isSelected! ? 1 : .0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
        onPressed: widget.onPressed,
        color: getButtonColor(),
        child: Text(
          widget.title.toUpperCase(),
          textAlign: TextAlign.center,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                fontSize: 12.sp,
                color: CupertinoColors.white.withOpacity(
                  widget.isSelected! ? .5 : 1,
                ),
              ),
        ),
      ),
    );
  }
}

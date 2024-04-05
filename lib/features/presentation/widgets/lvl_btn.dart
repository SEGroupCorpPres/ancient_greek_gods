import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LvlBtn extends StatelessWidget {
  final String title;
  final bool? isCompleted;
  final VoidCallback onPressed;

  const LvlBtn({
    super.key,
    required this.title,
    this.isCompleted = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: 1,
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            !isCompleted! ? Assets.iconsBtnBg : Assets.iconsCompleteLevelBg,
            width: 40.r,
            fit: BoxFit.cover,
          ),
          Image.asset(
            !isCompleted! ? Assets.iconsLevelBtn : Assets.iconsCompletedLvlBtn,
            width: 32.r,
            fit: BoxFit.cover,
          ),
          isCompleted!
              ? const Icon(
                  CupertinoIcons.check_mark,
                  color: CupertinoColors.white,
                )
              : Center(
                  child: Text(
                    title,
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
        ],
      ),
    );
  }
}

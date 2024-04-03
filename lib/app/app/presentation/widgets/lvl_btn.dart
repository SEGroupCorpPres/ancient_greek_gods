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
    return Positioned(
      bottom: 30,
      left: 5,
      child: CupertinoButton(
        pressedOpacity: 1,
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              !isCompleted! ? Assets.iconsBtnBg : Assets.iconsCompleteLevelBg,
            ),
            Image.asset(
              !isCompleted! ? Assets.iconsLevelBtn : Assets.iconsCompletedLvlBtn,
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
      ),
    );
  }
}

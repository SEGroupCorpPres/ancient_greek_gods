import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/presentation/pages/quiz_symbol_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/main_button.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/quiz_answer_btns.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Image.asset(
                width: size.width,
                height: 370.h,
                Assets.images3FactsScreenBg,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Positioned(
            top: 130,
            right: 0,
            child: Image.asset(
              Assets.godsApollo,
              width: 150.w,
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: CupertinoButton(
              pressedOpacity: 1,
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(20.r),
              child: SvgPicture.asset(
                Assets.iconsBackBtn,
                width: 30.w,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            bottom: 30,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: size.width,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * .7,
                            child: Text(
                              'Choose the correct answer'.toUpperCase(),
                              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 25.sp),
                            ),
                          ),
                          CupertinoButton(
                            color: AppColors.primaryColor,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            minSize: 20.r,
                            child: Text(
                              '50/50',
                              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w800),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      QuizAnswerButtons(size: size),
                    ],
                  ),
                  MainButton(
                    title: 'Continue',
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => QuizSymbolScreen(),
                        ),
                        (route) => false),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

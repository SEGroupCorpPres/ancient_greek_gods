import 'package:ancient_greek_gods/features/presentation/widgets/main_button.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FactsScreen extends StatefulWidget {
  const FactsScreen({super.key});

  @override
  State<FactsScreen> createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
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
              Assets.imagesApollo,
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
              height: size.height * .45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '3 facts'.toUpperCase(),
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 30.sp),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        softWrap: true,
                        'asd; lfhb pwreg fhwe jglh ;vero gewn fiowehr',
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  MainButton(title: 'I Agree', onPressed: () {}),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

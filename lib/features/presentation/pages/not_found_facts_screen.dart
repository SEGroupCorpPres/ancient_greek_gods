import 'package:ancient_greek_gods/features/presentation/pages/home_page.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/main_button.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotFoundFactsScreen extends StatelessWidget {
  const NotFoundFactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double homeIndicatorSize = mediaQueryData.padding.bottom;
    double top= MediaQuery.of(context).padding.top;
    bool isHomeIndicator = homeIndicatorSize != 0 ? true : false;
    return CupertinoPageScaffold(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Image.asset(
                width: size.width,
                height: isHomeIndicator ?  370.h : 440.h,
                Assets.images3FactsScreenBg,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Positioned(
            top: top + 120.h,
            right: -10.w,
            child: Image.asset(
              Assets.godsApollo,
              width: 130.w,
            ),
          ),
          Positioned(
            top: top + 20.h,
            left: 30.w,
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
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: size.width,
                // height: size.height * .45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width *.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'i have no more new facts for you'.toUpperCase(),
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 30.sp, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    MainButton(
                      title: 'Back to menu',
                      onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    MainButton(
                      title: 'listen again',
                      onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

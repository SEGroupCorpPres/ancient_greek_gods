import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/presentation/pages/start_game_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/main_button.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  final TextEditingController _nameController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _saveUserName(String name, BuildContext context) async {
    final SharedPreferences preferences = await _prefs;
    try {
      await preferences.setString('user_name', name.toUpperCase());
      if (!context.mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (_) => const StartGameScreen()),
        (route) => false,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  child: Image.asset(
                    Assets.imagesLoginBg,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'NAME YOUR'.toUpperCase(),
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 18.sp),
                  ),
                  Text(
                    'Hero'.toUpperCase(),
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 45.sp),
                  ),
                  CupertinoFormSection(
                    backgroundColor: AppColors.mainBgColor,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                    margin: EdgeInsets.only(bottom: 10.h),
                    footer: MainButton(title: 'Continue', onPressed: () => _saveUserName(_nameController.text, context)),
                    children: [
                      Container(
                        height: 45.h,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: CupertinoTextField(
                          textCapitalization: TextCapitalization.characters,
                          textAlign: TextAlign.center,
                          placeholderStyle: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                color: CupertinoColors.white.withOpacity(.4),
                              ),
                          onChanged: (value) {
                            // Yozuvni katta harflarga o'tkazish
                            value = value.toUpperCase();
                          },
                          placeholder: 'Hero Name',
                          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(),
                          controller: _nameController,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: AppColors.secondaryBtnBgColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

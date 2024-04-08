import 'dart:async';

import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/core/helpers/database_helper.dart';
import 'package:ancient_greek_gods/features/data/local/models/user_model.dart';
import 'package:ancient_greek_gods/features/presentation/pages/privacy_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/terms_of_use_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/settings_list_tile.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_redirect/store_redirect.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isSwitchedNotify = false;
  bool _isSwitchedMusic = false;
  DatabaseHelper dbHelper = DatabaseHelper();
  String userName = '';
  final AudioPlayer _player = AudioPlayer();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _playStopMusicOnBg() async {
    await _player.setAsset(Assets.soundsLacrimosa);
    await _player.setLoopMode(LoopMode.all);
    if (_isSwitchedMusic) {
      await _player.play();
    } else {
      await _player.stop();
    }
  }

  Future<String> _getEquippedHero() async {
    SharedPreferences preferences = await _prefs;
    String equippedHero = preferences.getString('equippedHero')!;
    return equippedHero;
  }

  Future<void> _setMusic(bool isSwitchedMusic) async {
    SharedPreferences preferences = await _prefs;
    await preferences.setBool('music', isSwitchedMusic);
  }

  Future<void> _setNotify(bool isSwitchedNotify) async {
    SharedPreferences preferences = await _prefs;
    await preferences.setBool('notify', isSwitchedNotify);
  }

  Future<bool> _getMusic() async {
    SharedPreferences preferences = await _prefs;
    bool isSwitchedMusic = preferences.getBool('music')!;
    return isSwitchedMusic;
  }

  Future<bool> _getNotify() async {
    SharedPreferences preferences = await _prefs;
    bool isSwitchedNotify = preferences.getBool('notify')!;
    return isSwitchedNotify;
  }

  Future<void> _getUserName() async {
    List<UserModel> users = await dbHelper.getUser();
    userName = users.first.name;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _getUserName();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        automaticallyImplyMiddle: false,
        border: const Border(),
        middle: Text(
          'Settings'.toUpperCase(),
          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Center(
              child: FutureBuilder(
                future: _getEquippedHero(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      String equippedHero = snapshot.data!;
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        width: size.width * .25,
                        height: size.width * .25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: AppColors.selectedBtnColor,
                          image: DecorationImage(
                            image: AssetImage('assets/images/gods/$equippedHero.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Center(
              child: Text(
                'Your hero'.toUpperCase(),
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: CupertinoButton(
                color: AppColors.secondaryBtnBgColor,
                pressedOpacity: .8,
                minSize: 50.h,
                alignment: Alignment.center,
                onPressed: () {},
                child: Center(
                  child: Text(
                    userName.toUpperCase(),
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16.sp),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              children: [
                FutureBuilder(
                  future: _getNotify(),
                  builder: (context, snapshot) {
                    bool isSwitchedNotify = snapshot.data ?? _isSwitchedNotify;
                    return SettingsListTile(
                      size: size,
                      title: 'Notifications',
                      trailing: Container(
                        height: 30.h,
                        width: 45.w,
                        margin: EdgeInsets.only(right: 5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.r),
                          border: Border.all(
                            color: CupertinoColors.white.withOpacity(isSwitchedNotify ? .0 : 1),
                          ),
                        ),
                        child: CupertinoSwitch(
                          activeColor: AppColors.primaryColor,
                          value: isSwitchedNotify,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedNotify = value;
                              _isSwitchedNotify = value;
                              _setNotify(isSwitchedNotify);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
                FutureBuilder(
                  future: _getMusic(),
                  builder: (context, snapshot) {
                    bool isSwitchedMusic = snapshot.data ?? _isSwitchedMusic;
                    _playStopMusicOnBg();

                    return SettingsListTile(
                      size: size,
                      title: 'Music',
                      trailing: Container(
                        height: 30.h,
                        width: 45.w,
                        margin: EdgeInsets.only(right: 5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.r),
                          border: Border.all(
                            color: CupertinoColors.white.withOpacity(isSwitchedMusic ? .0 : 1),
                          ),
                        ),
                        child: CupertinoSwitch(
                          activeColor: AppColors.primaryColor,
                          value: isSwitchedMusic,
                          onChanged: (value) async {
                            _isSwitchedMusic = value;
                            setState(() {
                              isSwitchedMusic = value;
                              _setMusic(isSwitchedMusic);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
                SettingsListTile(
                  size: size,
                  title: 'Privacy policy',
                  onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => PrivacyScreen(),
                    ),
                  ),
                ),
                SettingsListTile(
                  size: size,
                  title: 'Terms of Use',
                  onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => TermsOfUseScreen(),
                    ),
                  ),
                ),
                SettingsListTile(size: size, title: 'Rate us', onPressed: (){
                  StoreRedirect.redirect(
                    androidAppId: "com.iyaffle.rangoli",
                    iOSAppId: "585027354",
                  );
                },),
                SettingsListTile(size: size, title: 'Share app'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

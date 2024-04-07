import 'dart:math';

import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/core/helpers/database_helper.dart';
import 'package:ancient_greek_gods/features/data/local/data_sources/list_of_symbols.dart';
import 'package:ancient_greek_gods/features/data/local/models/symbol_model.dart';
import 'package:ancient_greek_gods/features/data/local/models/user_model.dart';
import 'package:ancient_greek_gods/features/presentation/pages/home_page.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/main_button.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class QuizSymbolScreen extends StatefulWidget {
  const QuizSymbolScreen({super.key, required this.randomGod});

  final int randomGod;

  @override
  State<QuizSymbolScreen> createState() => _QuizSymbolScreenState();
}

class _QuizSymbolScreenState extends State<QuizSymbolScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late VideoPlayerController _videoPlayerController;
  DatabaseHelper dbHelper = DatabaseHelper();

  late int randomGod;
  bool isExpanded = true;
  late FlickManager flickManager;
  int random = Random().nextInt(9);
  int newRandom = Random().nextInt(9);
  int randomPosition = Random().nextInt(2);
  int randomPosition2 = Random().nextInt(2);
  int randomPosition3 = Random().nextInt(2);

  int correctInt = 0;
  int? _selectedIndex;
  bool _isContinue = false;
  final bool _isCorrectSymbol = false;
  bool _isCorrectSymbolSelected = false;
  bool _isSeeAds = false;

  List<SymbolModel> symbolList = [];
  int userCoin = 0;

  @override
  void initState() {
    // TODO: implement initState
    addSymbolToList();
    randomGod = widget.randomGod;
    checkOldRandom();
    _getUser();
    checkOldRandomPosition();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(
        Assets.videoCallOfDutyMobileOfficialLaunchTrailer,
      ),
      onVideoEnd: () async {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

        await _goHome();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    flickManager.dispose();
    super.dispose();
  }

  void checkOldRandom() {
    if (newRandom == random || newRandom == correctInt || random == correctInt) {
      random = Random().nextInt(9);
      newRandom = Random().nextInt(9);
      checkOldRandom();
    }
  }

  Future<void> _goHome() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('congratulations'.toUpperCase()),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'you won'.toUpperCase(),
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.iconsCoin,
                        width: 50.w,
                      ),
                      Text(
                        !_isCorrectSymbolSelected ? '1500'.toUpperCase() : '3000'.toUpperCase(),
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                CupertinoButton(
                  child: Text(
                    'Go Home'.toUpperCase(),
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: CupertinoColors.link, fontSize: 14.sp),
                  ),
                  onPressed: () async {
                    await _claimCoin(!_isCorrectSymbolSelected ? 1500 : 3000);
                    if (!context.mounted) return;
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _getUser() async {
    List<UserModel> users = await dbHelper.getUser();
    userCoin = users.first.coin;
    setState(() {});
  }

  Future<void> _updateUser(int coin) async {
    // Foydalanuvchi ma'lumotlarini yangilash
    await dbHelper.updateUser(null, coin, null, null);
  }

  Future<void> _claimCoin(int coin) async {
    setState(() {
      userCoin += coin;
    });
    await _updateUser(userCoin);
  }

  void checkOldRandomPosition() {
    if (randomPosition == randomPosition2 || randomPosition2 == randomPosition3 || randomPosition == randomPosition3) {
      randomPosition = Random().nextInt(3);
      randomPosition2 = Random().nextInt(3);
      randomPosition3 = Random().nextInt(3);
      checkOldRandomPosition();
    }
  }

  void addSymbolToList() {
    for (var symbol in listOfSymbols) {
      SymbolModel symbolModel = SymbolModel.fromJson(symbol);
      symbolList.add(symbolModel);
    }
  }

  void _selectedSymbol(int index, int correctIndex) {
    _selectedIndex = index;
    if (_selectedIndex == correctIndex) {
      _isCorrectSymbolSelected = true;
    } else {
      _isCorrectSymbolSelected = false;
    }
    setState(() {});
  }

  AnimatedContainer _buildCongratulationWindow(Size size) {
    return _buildCongratulationWidget(size);
  }

  AnimatedContainer _buildCongratulationWidget(Size size) {
    return AnimatedContainer(
      duration: Duration.zero,
      width: size.width,
      height: !_isContinue
          ? 0
          : !_isCorrectSymbol
              ? size.width
              : size.width * 1.2,
      decoration: BoxDecoration(
        color: AppColors.mainBgColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: AnimatedCrossFade(
          alignment: Alignment.bottomCenter,
          firstChild: Container(),
          secondChild: _rewardScreen(size),
          crossFadeState: !_isContinue ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 2),
          reverseDuration: const Duration(seconds: 2),
          sizeCurve: Curves.ease,
        ),
      ),
    );
  }

  Widget _rewardScreen(Size size) {
    return _buildRewardWindow(size);
  }

  Widget _buildRewardWindow(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          !_isCorrectSymbolSelected ? 'You guessed wrong!'.toUpperCase() : 'You win!'.toUpperCase(),
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.w800),
        ),
        Column(
          children: [
            !_isCorrectSymbolSelected
                ? Column(
                    children: [
                      !_isCorrectSymbolSelected ? const Text('Correct answer') : Container(),
                      Image.asset(
                        !_isCorrectSymbolSelected ? symbolList[randomGod].image : Assets.iconsTreasure,
                        width: size.width * .3,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  )
                : Image.asset(
                    Assets.iconsTreasure,
                    width: size.width * .3,
                  ),
            // SizedBox(height: 40.h),
            Text(
              'Your reward '.toUpperCase(),
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.w800),
            ),
            SizedBox(
              width: size.width * .5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.iconsCoin,
                    width: 50.w,
                  ),
                  Text(
                    !_isCorrectSymbolSelected ? '1500'.toUpperCase() : '3000'.toUpperCase(),
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ],
        ),
        MainButton(
          title: 'see ads to claim reward',
          onPressed: () {
            _isSeeAds = true;
            setState(() {});
          },
        ),
      ],
    );
  }

  List<Widget> _symbols() => [
        GestureDetector(
          onTap: () => _selectedSymbol(0, 0),
          child: Image.asset(
            symbolList[randomGod].image,
            color: !((_selectedIndex != null) && _selectedIndex! == 0) ? AppColors.secondaryBtnBgColor : CupertinoColors.white,
          ),
        ),
        GestureDetector(
          onTap: () => _selectedSymbol(1, 0),
          child: Image.asset(
            symbolList[random].image,
            color: !((_selectedIndex != null) && _selectedIndex! == 1) ? AppColors.secondaryBtnBgColor : CupertinoColors.white,
          ),
        ),
        GestureDetector(
          onTap: () => _selectedSymbol(2, 0),
          child: Image.asset(
            symbolList[newRandom].image,
            color: !((_selectedIndex != null) && _selectedIndex! == 2) ? AppColors.secondaryBtnBgColor : CupertinoColors.white,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double homeIndicatorSize = mediaQueryData.padding.bottom;
    double top = MediaQuery.of(context).padding.top;
    bool isHomeIndicator = homeIndicatorSize != 0 ? true : false;
    return CupertinoPageScaffold(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Image.asset(
                width: size.width,
                height: isHomeIndicator ? 370.h : 440.h,
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
            bottom: 30.h,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: size.width,
                height: size.height * .55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: size.width * .8,
                          child: Text(
                            'You are correct, now select the symbol of this god'.toUpperCase(),
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 30.sp, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      _symbols()[randomPosition],
                      _symbols()[randomPosition2],
                      _symbols()[randomPosition3],
                    ]),
                    SizedBox(height: 20.h),
                    MainButton(
                      title: 'continue',
                      onPressed: () {
                        setState(() {
                          _isContinue = !_isContinue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: _buildCongratulationWindow(size),
          ),
          !_isSeeAds
              ? Container()
              : FlickVideoPlayer(
                  flickManager: flickManager,
                  preferredDeviceOrientation: const [DeviceOrientation.landscapeRight],
                  preferredDeviceOrientationFullscreen: const [DeviceOrientation.landscapeRight],
                )
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/data/local/data_sources/list_of_symbols.dart';
import 'package:ancient_greek_gods/features/data/local/models/symbol_model.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/main_button.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizSymbolScreen extends StatefulWidget {
  const QuizSymbolScreen({super.key});

  @override
  State<QuizSymbolScreen> createState() => _QuizSymbolScreenState();
}

class _QuizSymbolScreenState extends State<QuizSymbolScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isExpanded = true;

  int random = Random().nextInt(9);
  int newRandom = Random().nextInt(9);
  int correctInt = 0;
  int _selectedIndex = 0;
  bool _isContinue = false;
  List<SymbolModel> symbolList = [];

  @override
  void initState() {
    // TODO: implement initState
    addSymbolToList();
    checkOldRandom();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
  }

  void checkOldRandom() {
    if (newRandom == random || newRandom == correctInt || random == correctInt) {
      random = Random().nextInt(9);
      newRandom = Random().nextInt(9);
      checkOldRandom();
    }
  }

  void addSymbolToList() {
    for (var symbol in listOfSymbols) {
      SymbolModel symbolModel = SymbolModel.fromJson(symbol);
      symbolList.add(symbolModel);
    }
  }

  void _selectedSymbol(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // AnimatedContainer _buildCongratulationWindow(Size size) {
  //   return ;
  // }

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => _selectedSymbol(0),
                          child: Image.asset(
                            symbolList[0].image,
                            color: _selectedIndex == 0 ? CupertinoColors.white : AppColors.secondaryBtnBgColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _selectedSymbol(1),
                          child: Image.asset(
                            symbolList[random].image,
                            color: _selectedIndex == 1 ? CupertinoColors.white : AppColors.secondaryBtnBgColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _selectedSymbol(2),
                          child: Image.asset(
                            symbolList[newRandom].image,
                            color: _selectedIndex == 2 ? CupertinoColors.white : AppColors.secondaryBtnBgColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    MainButton(
                      title: 'continue',
                      onPressed: () {
                        setState(() {
                          _isContinue = !_isContinue;
                        });
                        print(_isContinue);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: size.width,
              height: !_isContinue ? 0 : size.height * .6,
              decoration: BoxDecoration(
                color: AppColors.mainBgColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                // child: AnimatedCrossFade(
                //   firstChild: Container(),
                //   secondChild: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // SizedBox(height: 20.h),
                //       Text(
                //         'You win!'.toUpperCase(),
                //         style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.w800),
                //       ),
                //
                //       // SizedBox(height: 40.h),
                //       Column(
                //         children: [
                //           Image.asset(
                //             Assets.iconsTreasure,
                //             width: size.width * .3,
                //           ),
                //       SizedBox(height: 40.h),
                //           Text(
                //             'Your reward '.toUpperCase(),
                //             style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.w800),
                //           ),
                //           SizedBox(
                //             width: size.width * .5,
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Image.asset(
                //                   Assets.iconsCoin,
                //                   width: 50.w,
                //                 ),
                //                 Text(
                //                   '1500'.toUpperCase(),
                //                   style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w800),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //       // SizedBox(height: 20.h),
                //       MainButton(
                //         title: 'continue',
                //         onPressed: () {
                //           setState(() {
                //             _isContinue = !_isContinue;
                //           });
                //         },
                //       ),
                //     ],
                //   ),
                //   crossFadeState: !_isContinue ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                //   duration: const Duration(seconds: 2),
                //   reverseDuration: const Duration(seconds: 2),
                //   sizeCurve: Curves.ease,
                // ),
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    if (!_isContinue) {
                      return Container();
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(height: 20.h),
                          Text(
                            'You win!'.toUpperCase(),
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.w800),
                          ),

                          // SizedBox(height: 40.h),
                          Column(
                            children: [
                              Image.asset(
                                Assets.iconsTreasure,
                                width: size.width * .3,
                              ),
                              SizedBox(height: 40.h),
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
                                      '1500'.toUpperCase(),
                                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 20.h),
                          MainButton(
                            title: 'continue',
                            onPressed: () {
                              setState(() {
                                _isContinue = !_isContinue;
                              });
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//
// class MyCustomWidget extends StatefulWidget {
//   @override
//   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }
//
// class _MyCustomWidgetState extends State<MyCustomWidget> {
//   String TapToExpandIt = 'Tap to Expand it';
//   String Sentence = 'Widgets that have global keys reparent their subtrees when'
//       ' they are moved from one location in the tree to another location in the'
//       ' tree. In order to reparent its subtree, a widget must arrive at its new'
//       ' location in the tree in the same animation frame in which it was removed'
//       ' from its old location the tree.'
//       ' Widgets that have global keys reparent their subtrees when they are moved'
//       ' from one location in the tree to another location in the tree. In order'
//       ' to reparent its subtree, a widget must arrive at its new location in the'
//       ' tree in the same animation frame in which it was removed from its old'
//       ' location the tree.';
//   bool isExpanded = true;
//   bool isExpanded2 = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//         children: [
//           InkWell(
//             highlightColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             onTap: () {
//               setState(() {
//                 isExpanded = !isExpanded;
//               });
//             },
//             child: AnimatedContainer(
//               margin: EdgeInsets.symmetric(
//                 horizontal: isExpanded ? 25 : 0,
//                 vertical: 20,
//               ),
//               padding: EdgeInsets.all(20),
//               height: isExpanded ? 70 : 330,
//               curve: Curves.fastLinearToSlowEaseIn,
//               duration: Duration(milliseconds: 1200),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xff6F12E8).withOpacity(0.5),
//                     blurRadius: 20,
//                     offset: Offset(5, 10),
//                   ),
//                 ],
//                 color: Color(0xff6F12E8),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(isExpanded ? 20 : 0),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         TapToExpandIt,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       Icon(
//                         isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
//                         color: Colors.white,
//                         size: 27,
//                       ),
//                     ],
//                   ),
//                   isExpanded ? SizedBox() : SizedBox(height: 20),
//                   AnimatedCrossFade(
//                     firstChild: Text(
//                       '',
//                       style: TextStyle(
//                         fontSize: 0,
//                       ),
//                     ),
//                     secondChild: Text(
//                       Sentence,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15.7,
//                       ),
//                     ),
//                     crossFadeState: isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//                     duration: Duration(milliseconds: 1200),
//                     reverseDuration: Duration.zero,
//                     sizeCurve: Curves.fastLinearToSlowEaseIn,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             highlightColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             onTap: () {
//               setState(() {
//                 isExpanded2 = !isExpanded2;
//               });
//             },
//             child: AnimatedContainer(
//               margin: EdgeInsets.symmetric(
//                 horizontal: isExpanded2 ? 25 : 0,
//                 vertical: 20,
//               ),
//               padding: EdgeInsets.all(20),
//               height: isExpanded2 ? 70 : 330,
//               curve: Curves.fastLinearToSlowEaseIn,
//               duration: Duration(milliseconds: 1200),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xffFF5050).withOpacity(0.5),
//                     blurRadius: 20,
//                     offset: Offset(5, 10),
//                   ),
//                 ],
//                 color: Color(0xffFF5050),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(isExpanded2 ? 20 : 0),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         TapToExpandIt,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       Icon(
//                         isExpanded2 ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
//                         color: Colors.white,
//                         size: 27,
//                       ),
//                     ],
//                   ),
//                   isExpanded2 ? SizedBox() : SizedBox(height: 20),
//                   AnimatedCrossFade(
//                     firstChild: Text(
//                       '',
//                       style: TextStyle(
//                         fontSize: 0,
//                       ),
//                     ),
//                     secondChild: Text(
//                       Sentence,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15.7,
//                       ),
//                     ),
//                     crossFadeState: isExpanded2 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//                     duration: Duration(milliseconds: 1200),
//                     reverseDuration: Duration.zero,
//                     sizeCurve: Curves.fastLinearToSlowEaseIn,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

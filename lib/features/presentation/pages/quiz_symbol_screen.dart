import 'dart:math';

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

class _QuizSymbolScreenState extends State<QuizSymbolScreen> {
  int random = Random().nextInt(9);
  int newRandom = Random().nextInt(9);
  int correctInt = 0;
  List<SymbolModel> symbolList = [];

  @override
  void initState() {
    // TODO: implement initState
    addSymbolToList();
    checkOldRandom();
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

  void _buildCongratulationWindow(){
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text('You Win'.toUpperCase()),
        );
      },
    );
  }

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
            child: SingleChildScrollView(
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
                        Image.asset(
                          symbolList[0].image,
                          color: CupertinoColors.white,
                        ),
                        Image.asset(symbolList[random].image),
                        Image.asset(symbolList[newRandom].image),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    MainButton(
                      title: 'continue',
                      onPressed: () {

                      },
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

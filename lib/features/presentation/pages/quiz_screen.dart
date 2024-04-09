import 'dart:async';
import 'dart:math';

import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/core/helpers/database_helper.dart';
import 'package:ancient_greek_gods/features/data/local/data_sources/quiz.dart';
import 'package:ancient_greek_gods/features/data/local/models/question_model.dart';
import 'package:ancient_greek_gods/features/data/local/models/quiz_model.dart';
import 'package:ancient_greek_gods/features/data/local/models/user_model.dart';
import 'package:ancient_greek_gods/features/presentation/pages/quiz_symbol_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/main_button.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/quiz_answer_btn.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/selected_hero.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'facts_screen.dart';

class QuizScreen extends StatefulWidget {
  final int level;
  final int randomGod;

  const QuizScreen({super.key, required this.level, required this.randomGod});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  DatabaseHelper dbHelper = DatabaseHelper();

  int incorrectCount = 0;
  int? level;
  int question = 0;

  // int correctAnswerIndex = 0;
  bool isChance = false;
  bool isSelected = false;

  int onTapCount = 0;

  // List<String> options = ['A', 'B', 'C', 'D'];
  List<bool> optionVisibilities = [true, true, true, true];
  late int correctAnswerIndex; // Random to'g'ri javobni tanlash
  List<bool> visibleOptions = [true, true, true, true];
  List<bool> _selectedAnswer = [false, false, false, false];
  List<bool?> _correctAnswer = [null, null, null, null];
  List<bool?> _wrongAnswer = [null, null, null, null];

  // Current selected answer index
  int selectedAnswerIndex = -1;
  late QuizModel quizModel;
  late QuestionModel questionModel;

  void _getQuiz() {
    quizModel = QuizModel.fromJson(quiz[widget.level]);
    print(quizModel);
    _getAnswer(quizModel);
  }

  void _getAnswer(QuizModel quizModel) {
    questionModel = quizModel.questions[question];
    print(questionModel);
  }

  void updateOptions() {
    optionVisibilities[correctAnswerIndex] = true;
    int randomIndex = Random().nextInt(4);
    int randomIndex2 = Random().nextInt(4);
    while (randomIndex == correctAnswerIndex || randomIndex == randomIndex2 || randomIndex2 == correctAnswerIndex) {
      randomIndex = Random().nextInt(4);
      randomIndex2 = Random().nextInt(4);
    }
    optionVisibilities[randomIndex] = false;
    optionVisibilities[randomIndex2] = false;
    visibleOptions = optionVisibilities;
  }

  Future<int> _getUserChance() async {
    List<UserModel> users = await dbHelper.getUser();

    int chance = users.first.chance;
    return chance;
  }

  Future<void> _updateUser(int chance) async {
    // Foydalanuvchi ma'lumotlarini yangilash
    await dbHelper.updateUser(null, null, chance, null);
  }

  // Function to handle button press
  void handleButtonPress(int index) {
    selectedAnswerIndex = index;
  }

  // Function to get the button color based on its index

  void _checkIsSelected(int index) {
    for (int i = 0; i < 4; i++) {
      _selectedAnswer[i] = false;
    }
    _selectedAnswer[index] = true;

    print(_selectedAnswer[index]);
  }

  bool _isCorrectAnswer(int index, QuestionModel questionModel) {
    if (questionModel.options[index] == questionModel.correctAnswer) {
      return true;
    }
    return false;
  }

  void _checkCorrectAnswer(QuestionModel questionModel) {
    if (_isCorrectAnswer(3, questionModel)) {
      correctAnswerIndex = 3;
    } else if (_isCorrectAnswer(2, questionModel)) {
      correctAnswerIndex = 2;
    } else if (_isCorrectAnswer(1, questionModel)) {
      correctAnswerIndex = 1;
    }
    if (_isCorrectAnswer(0, questionModel)) {
      correctAnswerIndex = 0;
    }
  }

  void _checkAnswer(QuestionModel questionModel) {
    if (_isCorrectAnswer(3, questionModel)) {
      for (int i = 0; i < 4; i++) {
        _correctAnswer[i] = null;
        _wrongAnswer[i] = null;
      }
      if (_selectedAnswer[3]) {
        _wrongAnswer[3] = false;
      }
      _correctAnswer[3] = true;
    } else if (_isCorrectAnswer(2, questionModel)) {
      for (int i = 0; i < 4; i++) {
        _correctAnswer[i] = null;
        _wrongAnswer[2] = null;
      }
      if (_selectedAnswer[2]) {
        _wrongAnswer[2] = false;
      }
      _correctAnswer[2] = true;
    } else if (_isCorrectAnswer(1, questionModel)) {
      for (int i = 0; i < 4; i++) {
        _correctAnswer[i] = null;
        _wrongAnswer[i] = null;
      }
      if (_selectedAnswer[1]) {
        _wrongAnswer[1] = false;
      }
      _correctAnswer[1] = true;
    } else if (_isCorrectAnswer(2, questionModel)) {
      for (int i = 0; i < 4; i++) {
        _correctAnswer[i] = null;
        _wrongAnswer[i] = null;
      }
      if (_selectedAnswer[0]) {
        _wrongAnswer[0] = false;
      }
      _correctAnswer[0] = true;
    }
    print(correctAnswerIndex);
  }

  @override
  void initState() {
    // TODO: implement initState
    level = widget.level;
    _getQuiz();
    // _getAnswer(quizModel);
    super.initState();
  }

  Future<void> _chanceAlert() async {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('warning'.toUpperCase()),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'you don\'t have a chance'.toUpperCase(),
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: CupertinoColors.destructiveRed,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
          actions: [
            CupertinoButton(
              child: Text(
                'Ok'.toUpperCase(),
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: CupertinoColors.link,
                      fontSize: 14.sp,
                    ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double homeIndicatorSize = mediaQueryData.padding.bottom;
    double top = MediaQuery.of(context).padding.top;
    bool isHomeIndicator = homeIndicatorSize != 0 ? true : false;

    // _checkAnswer(quizModel.questions[question]);
    _checkCorrectAnswer(questionModel);
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Image.asset(
                width: size.width,
                height: isHomeIndicator ? 400.h : 440.h,
                Assets.images3FactsScreenBg,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SelectedHero(),
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
                          FutureBuilder(
                            future: _getUserChance(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                int chanceCount = snapshot.data ?? 0;
                                if (snapshot.hasData) {
                                  return CupertinoButton(
                                    color: AppColors.primaryColor,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                    minSize: 20.r,
                                    child: Text(
                                      '50/50',
                                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w800),
                                    ),
                                    onPressed: () {
                                      updateOptions();
                                      setState(() {});
                                      // if (chanceCount > 0) {
                                      //   setState(() {
                                      //     isChance = true;
                                      //     chanceCount--;
                                      //     _updateUser(chanceCount);
                                      //   });
                                      // } else {
                                      //   await _chanceAlert();
                                      // }
                                    },
                                  );
                                } else {
                                  return const Center(
                                    child: CupertinoActivityIndicator(),
                                  );
                                }
                              }
                              return const Center(
                                child: CupertinoActivityIndicator(),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: size.width,
                                child: Text(
                                  quizModel.questions[question].question,
                                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16.sp),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: size.width,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceEvenly,
                              runSpacing: 10.h,
                              children: quizModel.questions[question].options.asMap().entries.map(
                                (entry) {
                                  int index = entry.key;
                                  String option = entry.value;
                                  return Visibility(
                                    visible: visibleOptions[index],
                                    maintainSize: true,
                                    maintainState: true,
                                    maintainSemantics: true,
                                    maintainAnimation: true,
                                    maintainInteractivity: true,
                                    child: QuizAnswerBtn(
                                      size: size,
                                      title: option,
                                      // bgColor: getButtonColor(index),
                                      onPressed: () {
                                        handleButtonPress(index);
                                        _checkIsSelected(index);
                                        setState(() {
                                          //   if (index == 0) {
                                          //     selectedAnswerIndex = 0;
                                          isSelected = true;
                                          //     answer1 = true;
                                          //     answer2 = false;
                                          //     answer3 = false;
                                          //     answer4 = false;
                                          //   }
                                        });
                                      },

                                      isSelected: _selectedAnswer[index],
                                      isCorrect: _wrongAnswer[index] != null ? _wrongAnswer[index]! : _correctAnswer[index],
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                      // QuizWidget(level: widget.level, question: question, visibleOptions: visibleOptions)
                    ],
                  ),
                  SizedBox(height: 20.h),
                  MainButton(
                    title: onTapCount == 0 ? 'check': 'Continue',
                    onPressed: () {
                      if (isSelected) {
                        if (onTapCount == 0) {
                          _checkAnswer(questionModel);

                          onTapCount++;

                        }else
                        if (onTapCount == 1) {
                          if (selectedAnswerIndex != correctAnswerIndex) {
                            incorrectCount++;
                          }
                          if (incorrectCount > 5) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => FactsScreen(
                                  isWrongAnswer: true,
                                  level: widget.level,
                                  retryCount: 1,
                                ),
                              ),
                              (route) => false,
                            );
                          }
                          if (question == quizModel.questions.length - 1) {
                            question = 0;
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => QuizSymbolScreen(
                                  randomGod: widget.randomGod,
                                  level: widget.level,
                                ),
                              ),
                              (route) => false,
                            );
                          } else {
                            isChance = false;
                          }
                          for (int i = 0; i < 4; i++) {
                            _correctAnswer[i] = null;
                            _wrongAnswer[i] = null;
                            _selectedAnswer[i] = false;
                          }
                          isSelected = false;
                          onTapCount = 0;
                          question++;

                        }

                        setState(() {});
                        // Chance tugmasi bosilgan
                        // Random to'g'ri va noto'g'ri variantlar tanlanadi

                        print(onTapCount.toString() + 'on tap');
                      }

                      // print(incorrectCount);
                    },
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

import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/data/local/data_sources/quiz.dart';
import 'package:ancient_greek_gods/features/data/local/models/question_model.dart';
import 'package:ancient_greek_gods/features/data/local/models/quiz_model.dart';
import 'package:ancient_greek_gods/features/presentation/pages/facts_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/quiz_symbol_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/main_button.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/quiz_answer_btn.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizScreen extends StatefulWidget {
  final int level;

  const QuizScreen({super.key, required this.level});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int incorrectCount = 0;
  int? level;
  int question = 1;
  bool isSelected = false;
  bool answer1 = false;
  bool answer2 = false;
  bool answer3 = false;
  bool answer4 = false;
  bool answerCorrect1 = false;
  bool answerCorrect2 = false;
  bool answerCorrect3 = false;
  bool answerCorrect4 = false;

  bool isCorrect = false;
  int correctAnswerIndex = 0;

  // Current selected answer index
  int selectedAnswerIndex = -1;

  // Function to handle button press
  void handleButtonPress(int index) {
    selectedAnswerIndex = index;
  }

  // Function to get the button color based on its index
  Color getButtonColor(int index) {
    if (index == selectedAnswerIndex) {
      if (selectedAnswerIndex == correctAnswerIndex) {
        return CupertinoColors.activeGreen; // Set green color for selected correct answer button
      } else {
        return CupertinoColors.destructiveRed; // Set red color for selected incorrect answer button
      }
    } else {
      return AppColors.secondaryBtnBgColor; // Default color for unselected buttons
    }
  }

  void checkAnswer() {
    Color buttonColor;

    if (selectedAnswerIndex != correctAnswerIndex) {
      buttonColor = AppColors.primaryColor;
    } else {
      buttonColor = CupertinoColors.destructiveRed;
    }
    setState(() {
      selectedAnswerIndex = correctAnswerIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    level = widget.level;
    super.initState();
  }

  void _nextQuestion() {
    question++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    QuizModel quizModel = QuizModel.fromJson(quiz[widget.level]);
    QuestionModel questionModel = quizModel.questions[question];
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double homeIndicatorSize = mediaQueryData.padding.bottom;
    double top = MediaQuery.of(context).padding.top;
    bool isHomeIndicator = homeIndicatorSize != 0 ? true : false;

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
                      SizedBox(
                        height: 10.h,
                      ),
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
                          children: [
                            QuizAnswerBtn(
                              size: size,
                              title: questionModel.options[0],
                              onPressed: () {
                                setState(() {
                                  selectedAnswerIndex = 0;
                                  answer1 = true;
                                  answer2 = false;
                                  answer3 = false;
                                  answer4 = false;
                                });
                              },
                              isSelected: answer1,
                              isCorrect: answerCorrect1,
                            ),
                            QuizAnswerBtn(
                              size: size,
                              title: questionModel.options[1],
                              onPressed: () {
                                setState(() {
                                  selectedAnswerIndex = 1;
                                  answer1 = false;
                                  answer2 = true;
                                  answer3 = false;
                                  answer4 = false;
                                });
                              },
                              isSelected: answer2,
                              isCorrect: answerCorrect2,
                            ),
                            QuizAnswerBtn(
                              size: size,
                              title: questionModel.options[2],
                              onPressed: () {
                                setState(() {
                                  selectedAnswerIndex = 2;
                                  answer1 = false;
                                  answer2 = false;
                                  answer3 = true;
                                  answer4 = false;
                                });
                              },
                              isSelected: answer3,
                              isCorrect: answerCorrect3,
                            ),
                            QuizAnswerBtn(
                              size: size,
                              title: questionModel.options[3],
                              onPressed: () {
                                setState(() {
                                  selectedAnswerIndex = 3;
                                  answer1 = false;
                                  answer2 = false;
                                  answer3 = false;
                                  answer4 = true;
                                });
                              },
                              isSelected: answer4,
                              isCorrect: answerCorrect4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  MainButton(
                    title: 'Continue',
                    onPressed: () {
                      if (questionModel.options[3] == questionModel.correctAnswer) {
                        correctAnswerIndex = 3;
                        answerCorrect1 = false;
                        answerCorrect2 = false;
                        answerCorrect3 = false;
                        answerCorrect4 = true;
                      } else if (questionModel.options[2] == questionModel.correctAnswer) {
                        correctAnswerIndex = 2;

                        answerCorrect1 = false;
                        answerCorrect2 = false;
                        answerCorrect3 = true;
                        answerCorrect4 = false;
                      } else if (questionModel.options[1] == questionModel.correctAnswer) {
                        correctAnswerIndex = 1;

                        answerCorrect1 = false;
                        answerCorrect2 = true;
                        answerCorrect3 = false;
                        answerCorrect4 = false;
                      } else if (questionModel.options[0] == questionModel.correctAnswer) {
                        correctAnswerIndex = 0;

                        answerCorrect1 = true;
                        answerCorrect2 = false;
                        answerCorrect3 = false;
                        answerCorrect4 = false;
                      }
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
                            (route) => false);
                      }
                      if (question == quizModel.questions.length -1) {
                        question = 0;
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => const QuizSymbolScreen(),
                            ),
                            (route) => false);
                      } else {
                        question++;
                      }
                      setState(() {
                        answer1 = false;
                        answer2 = false;
                        answer3 = false;
                        answer4 = false;
                        answerCorrect1 = false;
                        answerCorrect2 = false;
                        answerCorrect3 = false;
                        answerCorrect4 = false;
                      });
                      print(incorrectCount);
                    },
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

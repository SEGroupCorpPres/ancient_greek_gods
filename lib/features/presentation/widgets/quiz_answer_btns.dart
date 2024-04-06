import 'package:ancient_greek_gods/features/data/local/models/question_model.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/quiz_answer_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizAnswerButtons extends StatefulWidget {
  final Size size;
  final QuestionModel question;

  const QuizAnswerButtons({super.key, required this.size, required this.question});

  @override
  State<QuizAnswerButtons> createState() => _QuizAnswerButtonsState();
}

class _QuizAnswerButtonsState extends State<QuizAnswerButtons> {
  bool isSelected = false;
  late QuestionModel question;
  bool answer1 = false;
  bool answer2 = false;
  bool answer3 = false;
  bool answer4 = false;
  bool answerCorrect1 = false;
  bool answerCorrect2 = false;
  bool answerCorrect3 = false;
  bool answerCorrect4 = false;

  bool isCorrect = false;

  @override
  void initState() {
    // TODO: implement initState
    question = widget.question;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height * .2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuizAnswerBtn(
                size: widget.size,
                title: question.options[0],
                onPressed: () {
                  setState(() {
                    answer1 = true;
                    answer2 = false;
                    answer3 = false;
                    answer4 = false;

                    if (question.options[0] == question.correctAnswer) {
                      answerCorrect1 = true;
                      answerCorrect2 = false;
                      answerCorrect3 = false;
                      answerCorrect4 = false;
                    }

                  });
                },
                isSelected: answer1,
                isCorrect: isCorrect,
              ),
              QuizAnswerBtn(
                size: widget.size,
                title: question.options[1],
                onPressed: () {
                  setState(() {
                    answer1 = false;
                    answer2 = true;
                    answer3 = false;
                    answer4 = false;
                    if (question.options[2] == question.correctAnswer) {
                      answerCorrect1 = false;
                      answerCorrect2 = true;
                      answerCorrect3 = false;
                      answerCorrect4 = false;
                    }
                  });
                },
                isSelected: answer2,
                isCorrect: isCorrect,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuizAnswerBtn(
                size: widget.size,
                title: question.options[2],
                onPressed: () {
                  setState(() {
                    answer1 = false;
                    answer2 = false;
                    answer3 = true;
                    answer4 = false;
                    if (question.options[2] == question.correctAnswer) {
                      answerCorrect1 = false;
                      answerCorrect2 = false;
                      answerCorrect3 = true;
                      answerCorrect4 = false;
                    }
                  });
                },
                isSelected: answer3,
                isCorrect: isCorrect,
              ),
              QuizAnswerBtn(
                size: widget.size,
                title: question.options[3],
                onPressed: () {
                  setState(() {
                    answer1 = false;
                    answer2 = false;
                    answer3 = false;
                    answer4 = true;
                    if (question.options[3] == question.correctAnswer) {
                      answerCorrect1 = false;
                      answerCorrect2 = false;
                      answerCorrect3 = false;
                      answerCorrect4 = true;
                    }
                  });
                },
                isSelected: answer4,
                isCorrect: isCorrect,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:ancient_greek_gods/features/presentation/widgets/quiz_answer_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class QuizAnswerButtons extends StatefulWidget {
  final Size size;
  const QuizAnswerButtons({super.key, required this.size});

  @override
  State<QuizAnswerButtons> createState() => _QuizAnswerButtonsState();
}

class _QuizAnswerButtonsState extends State<QuizAnswerButtons> {
  bool isSelected = false;
  bool isCorrect = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height *.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuizAnswerBtn(
                size: widget.size,
                title: 'zeus',
                onPressed: () {
                  setState(() {
                    isSelected = true;
                    isCorrect = false;
                  });
                },
                isSelected: isSelected,
                isCorrect: isCorrect,
              ),
              QuizAnswerBtn(
                size: widget.size,
                title: 'paseidon',
                onPressed: () {
                  setState(() {
                    isSelected = false;
                    isCorrect = true;
                  });
                },
                isSelected: isSelected,
                isCorrect: isCorrect,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuizAnswerBtn(
                size: widget.size,
                title: 'zeus',
                onPressed: () {
                  setState(() {
                    isSelected = true;
                    isCorrect = false;
                  });
                },
                isSelected: isSelected,
                isCorrect: isCorrect,
              ),
              QuizAnswerBtn(
                size: widget.size,
                title: 'paseidon',
                onPressed: () {
                  setState(() {
                    isSelected = false;
                    isCorrect = true;
                  });
                },
                isSelected: isSelected,
                isCorrect: isCorrect,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:ancient_greek_gods/features/data/local/models/question_model.dart';
import 'package:ancient_greek_gods/features/data/local/models/quiz_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/local/data_sources/quiz.dart';
import '../widgets/quiz_answer_btn.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key, required this.level, required this.question, required this.visibleOptions});

  final int level;
  final int question;
  final List<bool> visibleOptions;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late QuizModel quizModel;
  late QuestionModel questionModel;

  void _getQuiz() {
    quizModel = QuizModel.fromJson(quiz[widget.level]);
  }

  void _getAnswer(QuizModel quizModel) {
    questionModel = quizModel.questions[widget.question];
  }

  @override
  void initState() {
    _getQuiz();
    _getAnswer(quizModel);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              width: size.width,
              child: Text(
                quizModel.questions[widget.question].question,
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
            children: questionModel.options.asMap().entries.map(
              (entry) {
                int index = entry.key;
                String option = entry.value;
                return Visibility(
                  visible: widget.visibleOptions[index],
                  maintainSize: true,
                  maintainState: true,
                  maintainSemantics: true,
                  maintainAnimation: true,
                  maintainInteractivity: true,
                  child: QuizAnswerBtn(
                    size: size,
                    title: option,
                    onPressed: () {
                      // setState(() {
                      //   if (index == 0) {
                      //     selectedAnswerIndex = 0;
                      //     isSelected = true;
                      //     answer1 = true;
                      //     answer2 = false;
                      //     answer3 = false;
                      //     answer4 = false;
                      //   }
                      // });
                    },
                    isSelected: false,
                    isCorrect: false,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}

import 'package:ancient_greek_gods/features/data/local/models/question_model.dart';

class QuizModel {
  final int level;
  final List<QuestionModel> questions;

  QuizModel({required this.level, required this.questions});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> data = json['questions'];
    List<QuestionModel> questionList = [];
    for (var value in data) {
      dynamic map = QuestionModel.fromJson(value);
      questionList.add(map);
    }
    return QuizModel(
      level: json['level'],
      questions: questionList
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['questions'] = questions.map((v) => v.toJson()).toList();

    return data;
  }
}

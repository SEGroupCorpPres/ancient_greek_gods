class QuestionModel {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuestionModel({required this.question, required this.options, required this.correctAnswer});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      options: json['options'].cast<String>(),
      correctAnswer: json['correct_answer'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['options'] = options;
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

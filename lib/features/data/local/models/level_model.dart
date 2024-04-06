class LevelModel {
  final int level;
  final int isCompleted;

  LevelModel({required this.level, required this.isCompleted});

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      level: json['level'],
      isCompleted: json['is_completed'],
    );
  }
}

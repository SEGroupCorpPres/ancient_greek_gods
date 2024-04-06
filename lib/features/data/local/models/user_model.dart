class UserModel {
  final String name;
  final int coin;
  final int chance;
  final int currentLevel;

  UserModel({
    required this.name,
    required this.coin,
    required this.chance,
    required this.currentLevel,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      coin: json['coin'],
      chance: json['chance'],
      currentLevel: json['current_level'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'coin': coin,
        'chance': chance,
        'current_level': currentLevel,
      };
}

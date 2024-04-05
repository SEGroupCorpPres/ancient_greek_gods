class HeroAboutModel {
  final String id;
  final String name;
  final List<String> abouts;

  HeroAboutModel({required this.id, required this.name, required this.abouts});

  factory HeroAboutModel.fromJson(Map<String, dynamic> json) {
    return HeroAboutModel(
      id: json['id'],
      name: json['name'],
      abouts: json['abouts'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abouts'] = abouts;
    return data;
  }
}

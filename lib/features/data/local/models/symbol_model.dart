class SymbolModel {
  final String name;
  final String image;
  // final String price;
  // final bool isEquip;

  SymbolModel({required this.name, required this.image});

  factory SymbolModel.fromJson(Map<String, dynamic> json) {
    return SymbolModel(
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
  };
}

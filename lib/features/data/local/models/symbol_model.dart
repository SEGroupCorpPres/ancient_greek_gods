class SymbolModel {
  final String id;
  final String name;
  final String image;

  // final String price;
  // final bool isEquip;

  SymbolModel({required this.id, required this.name, required this.image});

  factory SymbolModel.fromJson(Map<String, dynamic> json) {
    return SymbolModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}

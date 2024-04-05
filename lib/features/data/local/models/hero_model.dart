class HeroModel {
  final String name;
  final String image;
  final String price;
  final bool isEquip;

  HeroModel({
    required this.name,
    required this.image,
    required this.price,
    required this.isEquip,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      isEquip: json['isEquip'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'price': price,
        'isEquip': isEquip,
      };
}

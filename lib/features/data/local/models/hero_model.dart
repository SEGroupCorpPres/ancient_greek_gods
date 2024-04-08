class HeroModel {
  final int id;
  final String name;
  final String image;
  final int price;
  final int isEquip;

  HeroModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.isEquip,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      isEquip: json['is_equip'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'price': price,
        'isEquip': isEquip,
      };
}

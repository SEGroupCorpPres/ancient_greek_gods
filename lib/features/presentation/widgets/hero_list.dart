import 'package:ancient_greek_gods/features/data/local/data_sources/list_of_hero.dart';
import 'package:ancient_greek_gods/features/data/local/models/hero_model.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/hero_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroList extends StatelessWidget {
  final Size size;

  const HeroList({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      runSpacing: 20.h,
      children: listOfHero.map(
        (item) {
          HeroModel hero = HeroModel.fromJson(item);
          return HeroItem(hero: hero, size: size);
        },
      ).toList(),
    );
  }
}

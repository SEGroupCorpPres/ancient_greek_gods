import 'package:ancient_greek_gods/features/data/local/data_sources/list_of_gods.dart';
import 'package:ancient_greek_gods/features/data/local/models/god_model.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/god_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GodsList extends StatelessWidget {
  final Size size;

  const GodsList({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      runSpacing: 20.h,
      children: listOfGods.map(
        (item) {
          GodModel god = GodModel.fromJson(item);
          return GodItem(god: god, size: size);
        },
      ).toList(),
    );
  }
}

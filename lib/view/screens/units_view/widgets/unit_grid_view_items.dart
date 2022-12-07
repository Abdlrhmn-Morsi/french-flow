import 'package:educaation/data/app_data.dart';
import 'package:educaation/view/screens/units_view/widgets/unit_grid_item.dart';
import 'package:flutter/material.dart';
import '../../../../core/colors.dart';

class UnitGridViewItems extends StatelessWidget {
  const UnitGridViewItems({
    Key? key,
    required this.screenHeight,
    required this.studentImgesList,
  }) : super(key: key);

  final double screenHeight;
  final List studentImgesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: screenHeight * 0.60,
      decoration: const BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        shrinkWrap: true,
        itemCount: units.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0.0,
        ),
        itemBuilder: ((context, index) {
          Unit unit = units[index];
          return UnitGridItem(
            
            unit: unit,
            studentImgesList: studentImgesList,
            index: index,
          );
        }),
      ),
    );
  }
}

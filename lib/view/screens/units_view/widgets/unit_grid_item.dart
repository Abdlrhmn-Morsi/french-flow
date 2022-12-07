import 'package:educaation/data/app_data.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';
import '../../lessons_view/lessons_view.dart';

class UnitGridItem extends StatelessWidget {
  final List studentImgesList;
  final int index;
  final Unit unit;
  const UnitGridItem({
    Key? key,
    required this.unit,
    required this.studentImgesList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        index != 0
            ? null
            : Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>  LessonsView(lessons: unit.lesson)));
      }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 130,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(unit.img.toString()),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                decoration: BoxDecoration(
                  color: index == 0 ? null : Colors.black38,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: index == 0
                    ? null
                    : const Icon(Icons.lock, color: Colors.amber)),
          ),
          const SizedBox(height: 5),
          CustomText(
            text: unit.title.toString(),
            color: Colors.white,
          ),
          const SizedBox(height: 5),
          CustomText(
            textHight: 1.6,
            fontSize: 14,
            text: unit.description.toString(),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../data/app_data.dart';
import '../../../widgets/custom_text.dart';
import '../learning_view.dart';
import 'on_or_off_line_widget.dart';

class WatchYouTubLessonAndTestBtn extends StatelessWidget {
  const WatchYouTubLessonAndTestBtn({
    Key? key,
    required this.appUnits,
    required this.frenchClass,
  }) : super(key: key);

  final List<QuizFrench> appUnits;
  final FrenchClass frenchClass;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
          fontFamily: 'Aref_Ruqaa',
          color: AppColors.darkBlue,
          fontWeight: FontWeight.bold,
          text: 'شاهد ...',
          fontSize: 25,
        ),
        const SizedBox(height: 10),
        const OnOrOfflineWidget(),
        const SizedBox(height: 20),
        CustomBtn(AppUnits: appUnits),
      ],
    );
  }
}

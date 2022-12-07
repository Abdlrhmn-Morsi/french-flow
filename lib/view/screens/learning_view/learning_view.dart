import 'package:educaation/core/colors.dart';
import 'package:educaation/view/screens/learning_view/widgets/watch_youtube_lesson_and_test_btn.dart';
import 'package:educaation/view/screens/lessons_view/lessons_view.dart';
import 'package:flutter/material.dart';
import 'package:educaation/data/app_data.dart';
import 'package:educaation/view/widgets/custom_text.dart';
import '../../../logic/app_cubit/app_cubit.dart';
import '../../widgets/custom_app_bar.dart';
import '../quiz_view/quiz_view.dart';

class LearingView extends StatelessWidget {
  final FrenchClass? frenchClass;
  const LearingView({
    Key? key,
    this.frenchClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 0),
                  CustomAppBar(onTapBack: () => Navigator.maybePop(context)),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      isCenter: true,
                      text: frenchClass!.title.toString(),
                      color: AppColors.darkBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppCubit.get(context).customLearingContent(
                      context, frenchClass!.description!),
                  const SizedBox(height: 20),
                  const Divider(
                    color: AppColors.darkBlue,
                    height: 1,
                    thickness: 2,
                  ),
                  const SizedBox(height: 15),
                  WatchYouTubLessonAndTestBtn(
                      appUnits:frenchClass!.quizfrench! , frenchClass: frenchClass!),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    required this.AppUnits,
  }) : super(key: key);

  final List<QuizFrench> AppUnits;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 90,
      height: 35,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.darkBlue,
      onPressed: (() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => QuizView(quizfrench: AppUnits)));
      }),
      child: const CustomText(text: 'أختبار', color: AppColors.offWhite),
    );
  }
}

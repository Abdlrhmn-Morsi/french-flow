import 'package:educaation/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:educaation/data/app_data.dart';
import 'package:educaation/view/screens/learning_view/learning_view.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_person_card_info.dart';
import '../../widgets/custom_text.dart';
import '../units_view/units_view.dart';

class LessonsView extends StatelessWidget {
  final List<Lesson>? lessons;

  const LessonsView({
    Key? key,
    this.lessons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CustomAppBar(
                  onTapBack: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const UnitsView())))),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomPersonCardInfo(
                      screenHeight: screenHeight,
                      title: 'الوحده الاولي',
                      isQuizView: false,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, top: 20),
                      height: 100,
                      width: 100,
                      child: const CircularProgressIndicator(
                        value: .3,
                        backgroundColor: AppColors.offBlue,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const CustomText(
                  fontSize: 12,
                  color: AppColors.darkBlue,
                  text:
                      'سيتم فك قفل الدرس التالي مجرد حل اختبار الدرس السابق له ..'),
              CustomLessonCard(
                lessons: lessons!,
                screenHeight: screenHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLessonCard extends StatelessWidget {
  const CustomLessonCard({
    Key? key,
    required this.screenHeight,
    required this.lessons,
  }) : super(key: key);

  final double screenHeight;

  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: ((context, index) {
          Lesson lesson = lessons[index];
          return GestureDetector(
              onTap: (() {
                index == 0
                    ? Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LearingView(
                            frenchClass: lesson.frenchClass,
                          ),
                        ),
                      )
                    : null;
              }),
              child: Container(
                height: screenHeight * .15,
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: index % 2 != 0
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index % 2 != 0
                        ? CustomLessonContent(
                            title: lesson.title.toString(),
                            description: lesson.description.toString(),
                          )
                        : CustomLessonImg(
                            image: lesson.img.toString(),
                            index: index,
                          ),
                    const SizedBox(width: 20),
                    index % 2 != 0
                        ? CustomLessonImg(
                            image: lesson.img.toString(),
                            index: index,
                          )
                        : CustomLessonContent(
                            title: lesson.title.toString(),
                            description: lesson.description.toString(),
                          ),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}

class CustomLessonContent extends StatelessWidget {
  const CustomLessonContent({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.45,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            text: title,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          CustomText(
            fontSize: 12,
            text: description.toString(),
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class CustomLessonImg extends StatelessWidget {
  const CustomLessonImg({
    Key? key,
    required this.index,
    required this.image,
  }) : super(key: key);

  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: index == 0 ? null : Colors.black38,
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              index == 0 ? null : const Icon(Icons.lock, color: Colors.amber)),
    );
  }
}

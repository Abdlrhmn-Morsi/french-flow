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
    List choseFromList = [
      'lesson 1',
      'lesson 2',
      'lesson 3',
      'lesson 4',
      'lesson 5',
      'lesson 6',
    ];
    List studentImgesList = [
      'assets/images/student_img_1.jpg',
      'assets/images/student_img_2.jpg',
      'assets/images/student_img_3.jpg',
      'assets/images/student_img_4.jpg',
      'assets/images/student_img_5.jpg',
      'assets/images/student_img_6.jpg',
    ];
    return WillPopScope(
      onWillPop: () async {
        var val = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const UnitsView(),
          ),
        );
        if (val != null) {
          return Future.value(true);
        }
        {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 40),
                CustomAppBar(
                    onTapBack: () => Navigator.of(context).push(
                        MaterialPageRoute(
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
                  screenHeight: screenHeight,
                  choseFromList: choseFromList,
                  studentImgesList: studentImgesList,
                ),
              ],
            ),
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
    required this.choseFromList,
    required this.studentImgesList,
  }) : super(key: key);

  final double screenHeight;
  final List choseFromList;
  final List studentImgesList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: ((context, index) {
          // Lesson lesson = lessons[index];
          // FrenchClass frenchClass = lessons[index].frenchClass!;
          return GestureDetector(
              onTap: (() {
                index == 0
                    ? Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LearingView(),
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
                            choseFromList: choseFromList,
                            index: index,
                          )
                        : CustomLessonImg(
                            studentImgesList: studentImgesList,
                            index: index,
                          ),
                    const SizedBox(width: 20),
                    index % 2 != 0
                        ? CustomLessonImg(
                            studentImgesList: studentImgesList,
                            index: index,
                          )
                        : CustomLessonContent(
                            choseFromList: choseFromList,
                            index: index,
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
    required this.choseFromList,
    required this.index,
  }) : super(key: key);

  final List choseFromList;
  final int index;

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
            text: choseFromList[index],
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          const CustomText(
            fontSize: 12,
            text: 'ma famille et moi avons déménagé dans le sud de la France',
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          const CustomText(
            fontSize: 10,
            text:
                'Ma mère s\'appelle Emilie Summer:elle est infirmière dans un hôpital',
            color: Colors.white,
            isMaxLines: true,
            maxLines: 1,
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class CustomLessonImg extends StatelessWidget {
  const CustomLessonImg({
    Key? key,
    required this.studentImgesList,
    required this.index,
  }) : super(key: key);

  final List studentImgesList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(studentImgesList[index]),
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

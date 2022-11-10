import 'package:educaation/core/colors.dart';
import 'package:educaation/view/screens/lessons_view/lessons_view.dart';
import 'package:educaation/view/widgets/youtube_palyer.dart';
import 'package:flutter/material.dart';
import 'package:educaation/data/app_data.dart';
import 'package:educaation/view/widgets/custom_text.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../core/themes.dart';
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
    List<QuizFrench> AppUnits = units[0].lesson![0].frenchClass!.quizfrench!;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String content = appContent;

    return WillPopScope(
      onWillPop: () async {
        var val = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LessonsView(),
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
                    const Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        isCenter: true,
                        text: 'التحية باللغة الفرنسية Salutations',
                        color: AppColors.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AppCubit.get(context)
                        .customLearingContent(context, content),
                    const SizedBox(height: 20),
                    const Divider(
                      color: AppColors.darkBlue,
                      height: 1,
                      thickness: 2,
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        const CustomText(
                          fontFamily: 'Aref_Ruqaa',
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold,
                          text: 'شاهد ...',
                          fontSize: 25,
                        ),
                        const SizedBox(height: 10),
                        //! youtube player

                        OfflineBuilder(
                          child: const SizedBox(
                            height: 180,
                            child: YouTubePalyer(),
                          ),
                          connectivityBuilder: (
                            BuildContext context,
                            ConnectivityResult connectivity,
                            Widget child,
                          ) {
                            final bool connected =
                                connectivity != ConnectivityResult.none;

                            if (connected) {
                              return const SizedBox(
                                height: 200,
                                child: YouTubePalyer(),
                              );
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/play-button.png',
                                        width: 15,
                                      ),
                                      const SizedBox(width: 10),
                                      Image.asset(
                                        'assets/icons/wi-fi.png',
                                        width: 25,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const CustomText(
                                    text:
                                        'PLEASE CHECK YOUR INTERNET CONCTION  ....',
                                    color: Colors.red,
                                    fontSize: 8,
                                  ),
                                ],
                              );
                            }
                          },
                        ),

                        const SizedBox(height: 20),
                        //!quiz btn
                        MaterialButton(
                          minWidth: 90,
                          height: 35,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: AppColors.darkBlue,
                          onPressed: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    QuizView(quizfrench: AppUnits)));
                          }),
                          child: const CustomText(
                              text: 'أختبار', color: AppColors.offWhite),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

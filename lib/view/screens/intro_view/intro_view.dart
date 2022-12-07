import 'package:educaation/core/colors.dart';
import 'package:educaation/view/screens/units_view/units_view.dart';
import 'package:educaation/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/strings.dart';
import '../../../logic/app_cubit/app_cubit.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: screenHeight * .8,
            width: screenWidth,
            child: PageView(
              onPageChanged: (v) {
                AppCubit.get(context).holdIndicatorIndexFunc(v.toDouble() - 1);
                if (v - 1 == 1) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UnitsView()));
                }
              },
              allowImplicitScrolling: false,
              controller: controller,
              children: [
                Page1(index: 0),
                Page1(index: 1),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  controller.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColors.darkBlue,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    CustomText(
                      fontFamily: fontFamily2,
                      text: 'السابق',
                      color: AppColors.darkBlue,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              SmoothPageIndicator(
                effect: const WormEffect(
                  dotColor: AppColors.offBlue,
                  activeDotColor: AppColors.darkBlue,
                ),
                controller: controller,
                count: 2,
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: () {
                  AppCubit.get(context)
                      .holdIndicatorIndexFunc(controller.page!);
                  if (controller.page == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UnitsView()));
                  } else {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  }
                },
                child: BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    if (state is HoldIndicatorIndexState) {
                      return Row(
                        children: [
                          CustomText(
                            fontFamily: fontFamily2,
                            text: state.holdIndicatorIndex ? 'تم' : 'التالي',
                            color: AppColors.darkBlue,
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.darkBlue,
                            size: 18,
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: const [
                          CustomText(
                            fontFamily: fontFamily2,
                            text: 'التالي',
                            color: AppColors.darkBlue,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.darkBlue,
                            size: 18,
                          ),
                        ],
                      );
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  int index = 0;
  Page1({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final List<String> text = [
      'أهلاٌ بك ',
      'تعلم الفرنسيه بسهوله',
    ];
    final List<String> text1 = ['الفرنسيه اليوم', 'ماذا تنتظر ابدأ الأن'];
    final List<String> introImges = [
      'assets/images/intro-img-1.png',
      'assets/images/france-map-flag.png',
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UnitsView()));
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppColors.darkBlue,
                      ),
                      SizedBox(width: 5),
                      CustomText(
                        fontFamily: fontFamily2,
                        text: 'تخطي',
                        color: AppColors.darkBlue,
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: screenHeight * .5,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage(
                    introImges[index],
                  ),
                  fit: BoxFit.contain),
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(text[index]),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(text1[index]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

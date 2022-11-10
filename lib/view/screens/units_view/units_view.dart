import 'package:educaation/core/colors.dart';
import 'package:educaation/core/strings.dart';
import 'package:educaation/view/screens/units_view/widgets/custom_drawer.dart';
import 'package:educaation/view/screens/lessons_view/lessons_view.dart';
import 'package:educaation/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../logic/app_cubit/app_cubit.dart';
import '../../widgets/custom_text.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class UnitsView extends StatelessWidget {
  const UnitsView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List choseFromList = [
      'unit 1',
      'unit 2',
      'unit 3',
      'unit 4',
      'unit 5',
      'unit 6',
    ];
    List studentImgesList = [
      'assets/icons/1.jpg',
      'assets/icons/2.jpg',
      'assets/icons/7.jpg',
      'assets/icons/4.jpg',
      'assets/icons/5.jpg',
      'assets/icons/6.jpg',
      'assets/icons/3d-business-guy-with-backpack-and-laptop.png',
      'assets/images/student_img_1.jpg',
      'assets/images/student_img_2.jpg',
      'assets/images/student_img_3.jpg',
      'assets/images/student_img_4.jpg',
      'assets/images/student_img_5.jpg',
      'assets/images/student_img_6.jpg',
    ];

    return WillPopScope(
      onWillPop: () async {
        if (true) {
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: ZoomDrawer(
            isRtl: true,
            borderRadius: 40,
            showShadow: true,
            angle: 0.0,
            drawerShadowsBackgroundColor: AppColors.darkBlue,
            slideWidth: screenWidth * 0.65,
            controller: AppCubit.get(context).zoomDrawerController,
            menuScreen: CustomDrawer(),
            mainScreen: Container(
              color: AppColors.offWhite,
              width: screenWidth,
              height: screenHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: CustomAppBar(isHome: true, onTapBack: () {}),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  CustomText(
                                    fontFamily: 'Aref_Ruqaa',
                                    fontSize: 22,
                                    text: 'مرحبا بك',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    fontFamily: 'Aref_Ruqaa',
                                    fontSize: 22,
                                    text: 'هل انت جاهز لتعلم الغه الفرنسيه',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    fontFamily: 'Aref_Ruqaa',
                                    fontSize: 22,
                                    text: 'ماذا تنتظر ابدا الان',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/images/bg_profile.png',
                            height: 180,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.darkBlue,
                      text: 'كل مستوي مغلق حتي تنتهي من المستوي السابق له ..',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
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
                      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),

                      shrinkWrap: true,
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 0.0,
                      ),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: (() {
                            index != 0
                                ? null
                                : Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LessonsView()));
                          }),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 130,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(studentImgesList[index]),
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
                                        : const Icon(Icons.lock,
                                            color: Colors.amber)),
                              ),
                              const SizedBox(height: 5),
                              const CustomText(
                                text: 'الكورس الاول',
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              const CustomText(
                                textHight: 1.6,
                                fontSize: 12,
                                text: 'ليس بالامكان أفضل مما كان',
                                color: Colors.white,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

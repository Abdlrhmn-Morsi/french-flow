import 'package:educaation/view/screens/units_view/widgets/unit_grid_view_items.dart';
import 'package:educaation/view/screens/units_view/widgets/welcome_img_and_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:educaation/core/colors.dart';
import 'package:educaation/view/screens/units_view/widgets/custom_drawer.dart';
import 'package:educaation/view/widgets/custom_app_bar.dart';
import '../../../logic/app_cubit/app_cubit.dart';
import '../../widgets/custom_text.dart';

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
                  const WelcomeImgAndContent(),
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
                  UnitGridViewItems(
                      screenHeight: screenHeight,
                      studentImgesList: studentImgesList),
                ],
              ),
            )),
      ),
    );
  }
}






import 'package:flutter/material.dart';

import '../../core/colors.dart';
import 'custom_text.dart';

class CustomPersonCardInfo extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isQuizView;
  const CustomPersonCardInfo({
    Key? key,
    required this.screenHeight,
    this.subtitle,
    this.isQuizView = false,
    required this.title,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isQuizView ? 120 : 150,
      height: screenHeight * 0.14,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 40,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(30 / 360),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: isQuizView ? 65 : 80,
                width: isQuizView ? 65 : 80,
                decoration: BoxDecoration(
                    color: AppColors.offBlue,
                    border: Border.all(color: AppColors.offWhite, width: 3),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 20,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(10 / 360),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: isQuizView ? 75 : 90,
                width: isQuizView ? 75 : 90,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.offWhite, width: 3),
                  color: AppColors.offBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Container(
              padding: EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: isQuizView ? 10 : 0),
              height: isQuizView ? 90 : 95,
              width: isQuizView ? 90 : 95,
              decoration: BoxDecoration(
                  border: isQuizView
                      ? Border.all(color: AppColors.offWhite, width: 3)
                      : null,
                  color: isQuizView ? AppColors.offBlue : AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Spacer(),
                  CustomText(
                    text: title,
                    fontSize: isQuizView ? 12 : 14,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  isQuizView
                      ? CustomText(
                          text: subtitle ?? '',
                          fontSize: 12,
                          color: Colors.white,
                        )
                      : Container(
                          width: isQuizView ? 18 : 20,
                          height: isQuizView ? 18 : 20,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Image.asset(
                            'assets/icons/france.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                  SizedBox(height: isQuizView ? 0 : 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

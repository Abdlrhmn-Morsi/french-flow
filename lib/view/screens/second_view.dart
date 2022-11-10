import 'dart:ui';

import 'package:educaation/view/screens/units_view/units_view.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List choseFromList = [
      'frist high school',
      'second high school',
      'third high school',
    ];

    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              left: -88,
              height: screenHeight * 0.4,
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: const SizedBox(
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const CustomText(
                      text: 'cristiano ronaldo',
                      fontSize: 18,
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: choseFromList.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UnitsView()));
                          }),
                          child: Container(
                            height: 80,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.grey.shade400,
                                  offset: const Offset(5, 5),
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.grey.shade100,
                                  offset: const Offset(-5, -5),
                                  spreadRadius: 1,
                                )
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: const [0.1, 0.3, 0.6, 0.8],
                                colors: [
                                  Colors.blue.shade100,
                                  Colors.grey.shade300,
                                  Colors.grey.shade100,
                                  Colors.red.shade200,
                                ],
                              ),
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CustomText(text: choseFromList[index]),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

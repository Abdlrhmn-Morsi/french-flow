import 'package:flutter/material.dart';
import '../../../widgets/custom_text.dart';

class WelcomeImgAndContent extends StatelessWidget {
  const WelcomeImgAndContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

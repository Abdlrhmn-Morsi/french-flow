import 'package:educaation/core/colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';
import 'custom_drawer_item.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List title = [
    ['Order History', 'assets/icons/shopping-bag.png'],
    ['Your favorite', 'assets/icons/heart.png'],
    ['Dark mode', 'assets/icons/night.png'],
    ['Promotions', 'assets/icons/tag.png'],
    ['Settings', 'assets/icons/setting.png'],
    ['Log out', 'assets/icons/power-off.png']
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                ClipOval(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 183, 211, 228),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/bg_profile.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 5,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const CustomText(
            text: '@zakiMahmod',
            fontSize: 18,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: title.length,
            itemBuilder: (ctx, i) {
              return CustomDrawerItem(
                leading: SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset(
                    title[i][1],
                    color: title[i][0] == 'Your favorite'
                        ? Colors.red
                        : title[i][0] == 'Log out'
                            ? Colors.red
                            : AppColors.darkBlue,
                  ),
                ),
                onTap: () {},
                title: title[i][0],
              );
            },
          ),
        ],
      ),
    );
  }
}

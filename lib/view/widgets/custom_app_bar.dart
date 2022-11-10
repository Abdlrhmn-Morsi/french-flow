import 'package:educaation/view/screens/units_view/units_view.dart';
import 'package:flutter/material.dart';
import '../../logic/app_cubit/app_cubit.dart';

class CustomAppBar extends StatelessWidget {
  final bool isHome;
  final bool isQuizView;
  final void Function() onTapBack;
  const CustomAppBar({
    Key? key,
    required this.onTapBack,
    this.isQuizView = false,
    this.isHome = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: isQuizView ? 0 : 10, right: isQuizView ? 0 : 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isHome
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          AppCubit.get(context).toggleDrawer();
                        },
                        child: Container(
                            color: Colors.transparent,
                            width: 22,
                            child: Image.asset('assets/icons/menu-bar.png')),
                      );
                    },
                  ),
                )
              : GestureDetector(
                  onTap: onTapBack,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 22,
                    color: isQuizView ? Colors.white : Colors.black,
                  ),
                ),
          isHome
              ? Container()
              : Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UnitsView()));
                    },
                    child: Image.asset(
                      'assets/images/house.png',
                      width: 20,
                      color: isQuizView ? Colors.white : Colors.black,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/youtube_palyer.dart';

class OnOrOfflineWidget extends StatelessWidget {
  const OnOrOfflineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      child: const SizedBox(
        height: 180,
        child: YouTubePalyer(),
      ),
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

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
                text: 'PLEASE CHECK YOUR INTERNET CONCTION  ....',
                color: Colors.red,
                fontSize: 8,
              ),
            ],
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import '../../core/colors.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  void holdIndicatorIndexFunc(double index) {
    emit(HoldIndicatorIndexState(holdIndicatorIndex: index == 0));
  }

  static AppCubit get(context) => BlocProvider.of(context);

  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle!.call();
  }

  RichText customLearingContent(BuildContext context, String text) {
    List<String> split = text.split("(");

    List<String> frenchBold = split.getRange(1, split.length).fold([], (t, e) {
      var texts = e.split(")");

      if (texts.length > 1) {
        return List.from(t)
          ..addAll(["(${texts.first})", (e.substring(texts.first.length + 1))]);
      }
      return List.from(t)..add("(${texts.first}");
    });

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
          height: 1.5,
        ),
        children: [
          TextSpan(text: split.first),
          ...frenchBold
              .map(
                (text) => text.contains("(")
                    ? TextSpan(
                        text: text,
                        style: const TextStyle(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      )
                    : TextSpan(text: text),
              )
              .toList()
        ],
      ),
    );
  }
}

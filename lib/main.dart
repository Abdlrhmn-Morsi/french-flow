import 'package:educaation/logic/quiz_cubit/quiz_cubit.dart';
import 'package:educaation/logic/quize_result_cubit/quiz_result_cubit.dart';
import 'package:educaation/view/screens/intro_view/intro_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/themes.dart';
import 'logic/app_cubit/app_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuizCubit>(
          create: (BuildContext context) => QuizCubit(),
        ),
           BlocProvider<QuizResultCubit>(
          create: (BuildContext context) => QuizResultCubit(),
        ),
        BlocProvider<AppCubit>(
          create: (BuildContext context) => AppCubit(),
        )
      ],
      child: MaterialApp(
        locale: const Locale("ar", "AE"),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'AE'),
          Locale('en', 'US'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'frenchflow',
        home: const IntroView(),
        theme: Themes.light,
      ),
    );
  }
}

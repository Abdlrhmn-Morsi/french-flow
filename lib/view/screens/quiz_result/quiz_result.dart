import 'package:educaation/core/colors.dart';
import 'package:educaation/data/app_data.dart';
import 'package:educaation/logic/quiz_cubit/quiz_cubit.dart';
import 'package:educaation/logic/quize_result_cubit/quiz_result_cubit.dart';
import 'package:educaation/view/screens/lessons_view/lessons_view.dart';
import 'package:educaation/view/screens/quiz_view/quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_text.dart';

class QuizResult extends StatelessWidget {
  final List<QuizFrench> quizfrench;
  final int trueAnswer;

  const QuizResult(
      {super.key, required this.quizfrench, required this.trueAnswer});
  @override
  Widget build(BuildContext context) {
    List<QuizFrench> AppUnits = units[0].lesson![0].frenchClass!.quizfrench!;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        if (true) {
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: screenHeight * .7,
              decoration: const BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  CustomText(
                    textDirection: TextDirection.rtl,
                    color: trueAnswer < quizfrench.length - trueAnswer
                        ? const Color(0xffC83120)
                        : const Color(0Xff6CC9AC),
                    fontWeight: FontWeight.bold,
                    text:
                        'الاجابات الصحيحه $trueAnswer مـن ${quizfrench.length} أسئله',
                    fontSize: 20,
                  ),
                  const SizedBox(height: 50),
                  trueAnswer < quizfrench.length - trueAnswer
                      ? Image.asset(
                          'assets/images/sad-man.png',
                          height: 150,
                        )
                      : Image.asset(
                          'assets/images/congratulation.png',
                          height: 150,
                          color: AppColors.offBlue,
                        ),
                  const SizedBox(height: 20),
                  //! the score
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: 'لقد حصلت علي',
                            style: TextStyle(
                              color: AppColors.offWhite,
                              fontSize: 12,
                            )),
                        TextSpan(
                          text:
                              '  %${(trueAnswer / quizfrench.length * 100).floor()}  ',
                          style: TextStyle(
                            fontSize: 12,
                            color: trueAnswer < quizfrench.length - trueAnswer
                                ? const Color(0xffC83120)
                                : const Color(0Xff6CC9AC),
                          ),
                        ),
                        const TextSpan(
                          text: 'نقطه',
                          style: TextStyle(
                            color: AppColors.offWhite,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5),
                  const CustomText(
                    text: 'قم بالضغط لكي تري الاجابات الصحيحه',
                    color: AppColors.offWhite,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 20),
                  //! true and false
                  Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      quizfrench.length,
                      (index) => GestureDetector(
                        onTap: () {
                          QuizResultCubit.get(context)
                              .holdeQuistionIndexFunc(index);
                          QuizResultCubit.get(context)
                              .getTheCorrectAnswerFunc(index, AppUnits);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(5),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: quizfrench[index].isCorrectAnswer == null
                                ? Colors.blue.shade200
                                : quizfrench[index].isCorrectAnswer!
                                    ? const Color(0Xff6CC9AC)
                                    : const Color(0xffC83120),
                          ),
                          child: CustomText(
                            textDirection: TextDirection.ltr,
                            text: '$index',
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBlue,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //! Quistions
                  BlocBuilder<QuizResultCubit, QuizResultState>(
                      builder: (context, state) {
                    return QuizResultCubit.get(context).holdeQuistionIndex == -1
                        ? Container()
                        : CustomText(
                            textDirection: TextDirection.ltr,
                            color: AppColors.offWhite,
                            text: quizfrench[QuizResultCubit.get(context)
                                    .holdeQuistionIndex]
                                .quistion
                                .toString(),
                            fontSize: 20,
                          );
                  }),
                  const SizedBox(height: 15),
                  //! Answers ..
                  BlocBuilder<QuizResultCubit, QuizResultState>(
                      builder: (context, state) {
                    int holdeCorrectAnswerIndex =
                        QuizResultCubit.get(context).holdeCorrectAnswerIndex;
                    int holdeQuistionIndex =
                        QuizResultCubit.get(context).holdeQuistionIndex;
                    int chosenAnswer = quizfrench[
                            holdeQuistionIndex == -1 ? 0 : holdeQuistionIndex]
                        .chosenAnswer!;
                    return holdeCorrectAnswerIndex == -1
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              chosenAnswer == holdeCorrectAnswerIndex
                                  ? Container()
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: screenWidth * .7,
                                          color: Colors.transparent,
                                          child: CustomText(
                                            textDirection: TextDirection.ltr,
                                            maxLines: 2,
                                            isMaxLines: true,
                                            text:
                                                '${quizfrench[holdeQuistionIndex].options[chosenAnswer][1]}',
                                            color: Colors.blue,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        CustomText(
                                          textDirection: TextDirection.ltr,
                                          text:
                                              '${quizfrench[holdeQuistionIndex].options[chosenAnswer][0]})',
                                          color: AppColors.offBlue,
                                        ),
                                        const SizedBox(width: 10),
                                        Image.asset(
                                          'assets/icons/x-mark.png',
                                          height: 15,
                                          color: const Color(0xffC83120),
                                        ),
                                      ],
                                    ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: screenWidth * .7,
                                    color: Colors.transparent,
                                    child: CustomText(
                                      textDirection: TextDirection.ltr,
                                      maxLines: 2,
                                      isMaxLines: true,
                                      text:
                                          '${quizfrench[holdeQuistionIndex].options[holdeCorrectAnswerIndex][1]}',
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  CustomText(
                                    textDirection: TextDirection.ltr,
                                    text:
                                        '${quizfrench[holdeQuistionIndex].options[holdeCorrectAnswerIndex][0]})',
                                    color: AppColors.offBlue,
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    'assets/icons/check-mark.png',
                                    height: 15,
                                    color: const Color(0Xff6CC9AC),
                                  ),
                                ],
                              ),
                            ],
                          );
                  })
                ],
              ),
            ),
            const Spacer(),
            trueAnswer < quizfrench.length - trueAnswer
                ? MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    minWidth: 200,
                    color: AppColors.darkBlue,
                    onPressed: () {
                      QuizResultCubit.get(context).resetQuiz();
                      QuizCubit.get(context).resetQuiz();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => QuizView(quizfrench: AppUnits),
                        ),
                      );
                    },
                    child: const CustomText(
                        text: 'حاول مره أخري', color: AppColors.offWhite),
                  )
                : MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    minWidth: 200,
                    color: AppColors.darkBlue,
                    onPressed: () {
                      QuizResultCubit.get(context).resetQuiz();
                      QuizCubit.get(context).resetQuiz();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LessonsView(),
                        ),
                      );
                    },
                    child: const CustomText(
                        text: 'الدرس التالي', color: AppColors.offWhite),
                  ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

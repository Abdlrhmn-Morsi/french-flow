import 'package:audioplayers/audioplayers.dart';
import 'package:educaation/core/colors.dart';
import 'package:educaation/logic/quiz_cubit/quiz_cubit.dart';
import 'package:educaation/view/screens/learning_view/learning_view.dart';
import 'package:educaation/view/widgets/custom_app_bar.dart';
import 'package:educaation/view/widgets/custom_person_card_info.dart';
import 'package:flutter/material.dart';
import 'package:educaation/data/app_data.dart';
import 'package:educaation/view/widgets/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizView extends StatefulWidget {
  final List<QuizFrench> quizfrench;
  const QuizView({
    Key? key,
    required this.quizfrench,
  }) : super(key: key);

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  @override
  void initState() {
    super.initState();
    QuizCubit.get(context).audioCache = AudioCache();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          var nextQuestion = QuizCubit.get(context).nextQuestion;

          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 300,
                  decoration: const BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CustomAppBar(
                          isQuizView: true,
                          onTapBack: () => Navigator.maybePop(context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomPersonCardInfo(
                            screenHeight: screenHeight,
                            title: 'الكورس الاول',
                            subtitle: 'الدرس الاول',
                            isQuizView: true,
                          ),
                        ],
                      ),
                      //! answerdQ
                      Row(
                        children: [
                          const CustomText(
                              color: AppColors.offWhite,
                              text: 'الســـؤال',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          const SizedBox(width: 10),
                          CustomText(
                            text: '0${nextQuestion + 1}',
                            fontSize: 30,
                            color: AppColors.offWhite,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(width: 5),
                          CustomText(
                            text: '/0${widget.quizfrench.length}',
                            fontSize: 20,
                            color: AppColors.offWhite,
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColors.offWhite,
                        thickness: 2,
                      ),
                      const Spacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            textDirection: TextDirection.ltr,
                            color: AppColors.offWhite,
                            text: widget.quizfrench[nextQuestion].quistion
                                .toString(),
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  shrinkWrap: true,
                  itemCount: widget.quizfrench.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        QuizCubit.get(context).whenUserPressedOnItem(
                          context: context,
                          index: index,
                          quizfrench: widget.quizfrench,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: screenWidth * .9,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: QuizCubit.get(context)
                                .changeQuizItemColorIsTrueOrFalse(
                                    index: index,
                                    quizfrench: widget.quizfrench),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth * .80,
                              child: CustomText(
                                textDirection: TextDirection.ltr,
                                maxLines: 2,
                                isMaxLines: true,
                                text: widget.quizfrench[nextQuestion]
                                    .options[index][1]
                                    .toString(),
                                color: QuizCubit.get(context)
                                    .changeQuizItemColorIsTrueOrFalse(
                                        index: index,
                                        quizfrench: widget.quizfrench),
                              ),
                            ),
                            const Spacer(),
                            LeadingQuistionIcon(widget: widget,index: index,)
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                //!btns
                ChoseAndNextBtn(widget: widget),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LeadingQuistionIcon extends StatelessWidget {
  final QuizView widget;
  final int index;

  const LeadingQuistionIcon({
    Key? key,
    required this.index,
    required this.widget,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        QuizCubit.get(context)
            .changeQuizItemICONisTrueOrFalse(
                index: index),
        color: QuizCubit.get(context)
            .changeQuizItemColorIsTrueOrFalse(
                isIcon: true,
                index: index,
                quizfrench: widget.quizfrench),
        size: 20,
      ),
    );
  }
}

class ChoseAndNextBtn extends StatelessWidget {
  const ChoseAndNextBtn({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final QuizView widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          minWidth: 100,
          height: 50,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
          color: AppColors.darkBlue,
          onPressed: (() {
            QuizCubit.get(context).checkAndGoToNextQuistion(
              quizfrench: widget.quizfrench,
              context: context,
            );
          }),
          child: Row(
            children: [
              Icon(
                QuizCubit.get(context).isUserChoseAnAnswer
                    ? Icons.arrow_back
                    : Icons.check,
                color: AppColors.offWhite,
                size: 20,
              ),
              const SizedBox(width: 8),
              CustomText(
                text: QuizCubit.get(context).isUserChoseAnAnswer
                    ? 'التالي'
                    : 'اختر',
                color: AppColors.offWhite,
                fontSize: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:educaation/data/app_data.dart';
import 'package:educaation/view/screens/quiz_result/quiz_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/colors.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  static QuizCubit get(context) => BlocProvider.of(context);
  //!variables
  AudioCache? audioCache;
  bool isSelected = false;
  int nextQuestion = 0;
  int pressedIndex = -1;
  int trueAnswer = 0;
  bool isUserChoseAnAnswer = false;
  bool goToNextQ = false;
  int holdeCorrectAnswerIndex = -1;

  //! whenUserPressedOnItem
  void whenUserPressedOnItem({index, List<QuizFrench>? quizfrench, context}) {
    if (!isUserChoseAnAnswer) {
      equalPressedIndexWithIndex(index!);

      isChosenRightOrFalse(quizfrench!, index);
      getTheChosenAnswer(index, quizfrench);
      emit(WhenUserPressedOnItemState());
    }
  }

  void equalPressedIndexWithIndex(int index) {
    isSelected = true;
    pressedIndex = index;
    emit(IndexEqualState());
  }

  void isChosenRightOrFalse(List<QuizFrench> quizfrench, int index) {
    if (quizfrench[nextQuestion].options[index][0] ==
        quizfrench[nextQuestion].correctAnswer) {
      quizfrench[nextQuestion].isCorrectAnswer = true;

      emit(RightAnswerState());
    } else {
      quizfrench[nextQuestion].isCorrectAnswer = false;
    }
  }

  void getTheChosenAnswer(int index, List<QuizFrench>? quizfrench) {
    quizfrench![nextQuestion].chosenAnswer = index;
    emit(GetTheChosenAnswerState());
  }

//!whenUserPressedOn chose an next btn
  void checkAndGoToNextQuistion({List<QuizFrench>? quizfrench, context}) {
    if (goToNextQ) {
      goToNextQuestion(quizfrench!.length, quizfrench, context!);
      resetToNextQuistion();
    } else {
      getTheCorrectAnswerIndex(quizfrench);
      playChosenAnswerSound(quizfrench);
    }
  }

  void goToNextQuestion(int length, List<QuizFrench> quizfrench, context) {
    if (nextQuestion < length - 1 && isSelected) {
      nextQuestion++;
      isSelected = false;
      pressedIndex = -1;
    } else if (nextQuestion >= length - 1) {
      isSelected = false;
      pressedIndex = -1;
      caculateTrueAnswer(quizfrench: quizfrench);
      navigateToQuizResultPage(context: context, quizfrench: quizfrench);
    }
    emit(NextQuestionState());
  }

  void getTheCorrectAnswerIndex(List<QuizFrench>? quizfrench) {
    for (var i = 0; i < quizfrench![nextQuestion].options.length; i++) {
      if (quizfrench[nextQuestion].correctAnswer ==
          quizfrench[nextQuestion].options[i][0]) {
        holdeCorrectAnswerIndex = i;
      }
    }
    emit(HoldCorrectAnswerIndexState());
  }

  //? chosen sound effect
  void playChosenAnswerSound(List<QuizFrench>? quizfrench) {
    if (pressedIndex != -1 &&
        quizfrench![nextQuestion].correctAnswer ==
            quizfrench[nextQuestion].options[pressedIndex][0]) {
      goToNextQ = true;
      isUserChoseAnAnswer = true;
      playRightAnswerSound();
    } else if (pressedIndex != -1) {
      goToNextQ = true;
      isUserChoseAnAnswer = true;
      playWrongAnswerSound();
    }
    emit(HoldCorrectAnswerIndexState());
  }

  void playRightAnswerSound() async {
    await audioCache!.play('sounds/zapsplat.mp3');
    emit(PlayWrongAudioState());
  }

  void playWrongAnswerSound() async {
    await audioCache!.play('sounds/wrong-answer.mp3');
    emit(PlayWrongAudioState());
  }

  void caculateTrueAnswer({List<QuizFrench>? quizfrench}) {
    for (var element in quizfrench!) {
      if (element.isCorrectAnswer!) {
        trueAnswer++;
      }
    }
  }

  void navigateToQuizResultPage({List<QuizFrench>? quizfrench, context}) {
    Navigator.of(context!).pushReplacement(
      MaterialPageRoute(
        builder: (context) => QuizResult(
          trueAnswer: trueAnswer,
          quizfrench: quizfrench!,
        ),
      ),
    );
  }

//! for reset
  void resetQuiz() {
    isSelected = false;
    pressedIndex = -1;
    nextQuestion = 0;
    trueAnswer = 0;
  }

  void resetToNextQuistion() {
    goToNextQ = false;
    holdeCorrectAnswerIndex = -1;
    isUserChoseAnAnswer = false;
  }

//! widget change color or icon based on Chose
  IconData changeQuizItemICONisTrueOrFalse({int? index}) {
    return isUserChoseAnAnswer
        ? holdeCorrectAnswerIndex == index
            ? Icons.check
            : pressedIndex == index
                ? Icons.close
                : pressedIndex == index
                    ? Icons.close
                    : Icons.close
        : pressedIndex == index
            ? Icons.check
            : Icons.close;
  }

  Color changeQuizItemColorIsTrueOrFalse(
      {bool isIcon = false, int? index, List<QuizFrench>? quizfrench}) {
    return isUserChoseAnAnswer
        ? holdeCorrectAnswerIndex == index
            ? quizfrench![holdeCorrectAnswerIndex].statsColor = Colors.green
            : pressedIndex == index
                ? quizfrench![pressedIndex].statsColor = Colors.red
                : pressedIndex == index
                    ? Colors.blue
                    : isIcon
                        ? Colors.white
                        : AppColors.darkBlue
        : pressedIndex == index
            ? Colors.blue
            : isIcon
                ? Colors.white
                : AppColors.darkBlue;
  }
}

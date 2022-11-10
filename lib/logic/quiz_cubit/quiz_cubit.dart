import 'package:audioplayers/audioplayers.dart';
import 'package:educaation/data/app_data.dart';
import 'package:educaation/view/screens/quiz_result/quiz_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/colors.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  AudioCache? audioCache;

  bool isSelected = false;
  int nextQuestion = 0;
  int pressedIndex = -1;
  int trueAnswer = 0;

  //!---------------------
  bool isTheSelectedIsTrue = false;
  bool fristCheckisTheSelectedIsTrue = false;
  bool goToNextQ = false;
  int holdeCorrectAnswerIndex = -1;

  static QuizCubit get(context) => BlocProvider.of(context);

  void nextQuestionfunc(
      int length, List<QuizFrench> quizfrench, BuildContext context) {
    if (nextQuestion < length - 1 && isSelected) {
      nextQuestion++;
      isSelected = false;
      pressedIndex = -1;
    } else if (nextQuestion >= length - 1) {
      isSelected = false;
      pressedIndex = -1;
      caculateTotlaAndNavigate(quizfrench, context);
    }
    emit(NextQuestionState());
  }

  void caculateTotlaAndNavigate(
      List<QuizFrench> quizfrench, BuildContext context) {
    for (var element in quizfrench) {
      if (element.isCorrectAnswer!) {
        trueAnswer++;
      }
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuizResult(
          trueAnswer: trueAnswer,
          quizfrench: quizfrench,
        ),
      ),
    );
  }

  void rightAnswerFunc(List<QuizFrench> quizfrench, int index) {
    if (quizfrench[nextQuestion].options[index][0] ==
        quizfrench[nextQuestion].trueAnswer) {
      quizfrench[nextQuestion].isCorrectAnswer = true;

      emit(RightAnswerState());
    } else {
      quizfrench[nextQuestion].isCorrectAnswer = false;
    }
  }

  void indexEqualFunc(int index) {
    isSelected = true;
    pressedIndex = index;
    emit(IndexEqualState());
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
    isTheSelectedIsTrue = false;
    fristCheckisTheSelectedIsTrue = false;
  }

//! for the quiz result
  void getTheChosenAnswerFunc(int index, List<QuizFrench>? quizfrench) {
    quizfrench![nextQuestion].chosenAnswer = index;
    emit(GetTheChosenAnswerState());
  }

//!---
  void checkIfHeChoseTheRightAnswerFunc(List<QuizFrench>? quizfrench) {
    if (quizfrench![nextQuestion].trueAnswer ==
        quizfrench[nextQuestion].options[pressedIndex][0]) {
      isTheSelectedIsTrue = true;
      goToNextQ = true;
      fristCheckisTheSelectedIsTrue = true;
      playRightAnswerSound();
    } else {
      isTheSelectedIsTrue = false;
      fristCheckisTheSelectedIsTrue = true;
      goToNextQ = true;
      playWrongAnswerSound();
    }
    emit(HoldCorrectAnswerIndexState());
  }

  void getTheCorrectAnswerFunc(List<QuizFrench>? quizfrench) {
    for (var i = 0; i < quizfrench![nextQuestion].options.length; i++) {
      if (quizfrench[nextQuestion].trueAnswer ==
          quizfrench[nextQuestion].options[i][0]) {
        holdeCorrectAnswerIndex = i;
      }
    }
    emit(HoldCorrectAnswerIndexState());
  }

//! chosen sound effect
  void playRightAnswerSound() async {
    await audioCache!.play('sounds/zapsplat.mp3');
    emit(PlayWrongAudioState());
  }

  void playWrongAnswerSound() async {
    await audioCache!.play('sounds/wrong-answer.mp3');
    emit(PlayWrongAudioState());
  }

  Color changeQuizItemColorIsTrueOrFalse(
      {bool isIcon = false, int? index, List<QuizFrench>? quizfrench}) {
    return fristCheckisTheSelectedIsTrue
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

  IconData changeQuizItemICONisTrueOrFalse({int? index}) {
    return fristCheckisTheSelectedIsTrue
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
}

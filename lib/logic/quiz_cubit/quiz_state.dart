part of '../quiz_cubit/quiz_cubit.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class NextQuestionState extends QuizState {

}
class RightAnswerState extends QuizState{
}
class PreviousQuestionState extends QuizState{

}
class IndexEqualState extends QuizState{
  
}

class HoldCorrectAnswerIndexState extends QuizState{
  
}
class GetTheChosenAnswerState extends QuizState{
  
}
class PlayWrongAudioState extends QuizState{
  
}
part of 'quiz_result_cubit.dart';

abstract class QuizResultState {}

class QuizResultInitial extends QuizResultState {}

class ResetState extends QuizResultState {}

class HoldIndexState extends QuizResultState {}

class HoldCorrectAnswerIndexState extends QuizResultState {}

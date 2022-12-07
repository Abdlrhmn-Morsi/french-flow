import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/app_data.dart';
part 'quiz_result_state.dart';

class QuizResultCubit extends Cubit<QuizResultState> {
  QuizResultCubit() : super(QuizResultInitial());

  static QuizResultCubit get(context) => BlocProvider.of(context);

  int holdeQuistionIndex = -1;
  int holdeCorrectAnswerIndex = -1;
  int holdeWrongAnswerIndex = -1;

  void getQuistionIndexAndCorrectAnswer({index, List<QuizFrench>? quizfrench}) {
    holdeQuistionIndexFunc(index);
    getTheCorrectAnswerFunc(index, quizfrench);
  }

  void holdeQuistionIndexFunc(int index) {
    holdeQuistionIndex = index;
    emit(HoldIndexState());
  }

  void getTheCorrectAnswerFunc(int index, List<QuizFrench>? quizfrench) {
    for (var i = 0; i < quizfrench![index].options.length; i++) {
      if (quizfrench[index].correctAnswer == quizfrench[index].options[i][0]) {
        holdeCorrectAnswerIndex = i;
      }
    }
    emit(HoldCorrectAnswerIndexState());
  }

  void resetQuiz() {
    holdeCorrectAnswerIndex = -1;
    holdeQuistionIndex = -1;
    holdeWrongAnswerIndex = -1;
    emit(ResetState());
  }
}

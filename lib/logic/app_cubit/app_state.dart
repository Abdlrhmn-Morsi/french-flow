// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppDrawerState extends AppState {}

// ignore: must_be_immutable
class HoldIndicatorIndexState extends AppState {
  bool holdIndicatorIndex = false;
  HoldIndicatorIndexState({
    required this.holdIndicatorIndex,
  });
}

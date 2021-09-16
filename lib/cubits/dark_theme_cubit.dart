import 'package:flutter_bloc/flutter_bloc.dart';

//cubit for app theme selecion
class DarkThemeCubit extends Cubit<bool> {
  DarkThemeCubit(bool initialState) : super(initialState);
  toggle(bool x) {
    emit(x);
  }
}

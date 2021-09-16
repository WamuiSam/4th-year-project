import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:place_picker/entities/entities.dart';

//cubit that stores data  about the destination of the user

class WhereToCubit extends Cubit<LocationResult> {
  WhereToCubit(LocationResult initialState) : super(initialState);
}

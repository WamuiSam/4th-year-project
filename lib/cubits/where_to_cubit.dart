import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:place_picker/entities/entities.dart';

class WhereToCubit extends Cubit<LocationResult> {
  WhereToCubit(LocationResult initialState) : super(initialState);
}

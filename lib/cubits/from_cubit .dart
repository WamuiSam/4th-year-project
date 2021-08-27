import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:place_picker/entities/entities.dart';

class FromCubit extends Cubit<LocationResult> {
  FromCubit(LocationResult initialState) : super(initialState);
}

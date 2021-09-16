import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:place_picker/entities/entities.dart';

//cubit that selects the users location by default
class FromCubit extends Cubit<LocationResult> {
  FromCubit(LocationResult initialState) : super(initialState);
}

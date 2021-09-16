import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// cubit that draws polylines between the locations that user will select
class PolyLinesCubit extends Cubit<Polyline> {
  PolyLinesCubit(Polyline initialState) : super(initialState);
}

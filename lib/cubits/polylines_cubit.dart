import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLinesCubit extends Cubit<Set<Polyline>> {
  PolyLinesCubit(Set<Polyline> initialState) : super(initialState);
}
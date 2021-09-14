import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:wamui/models/flow_segment_data.dart';
import 'package:wamui/services/traffic_services.dart';
part 'trafick_info_state.dart';

class TrafickInfoCubit extends Cubit<TrafickInfoState> {
  TrafickInfoCubit() : super(TrafickInfoInitial());

  getInfo(
      {required int versionNumber,
      required String style,
      required int zoom,
      required double latitude,
      required double longitude}) async {
    emit(TrafickInfoLoading());
    try {
      var x = await TrafficServices.getFlowSegmentData(
          versionNumber: versionNumber,
          style: style,
          zoom: zoom,
          latitude: latitude,
          longitude: longitude);
      emit(TrafickInfoSuccess(x));
    } catch (e) {
      emit(TrafickInfoFailed(e.toString()));
    }
  }
}

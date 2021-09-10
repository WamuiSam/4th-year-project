import 'package:freezed_annotation/freezed_annotation.dart';

part 'flow_segment_data.freezed.dart';
part 'flow_segment_data.g.dart';

@freezed
class FlowSegmentData with _$FlowSegmentData {
  factory FlowSegmentData(
      {String? frc,
      int? currentSpeed,
      int? freeFlowSpeed,
      int? currentTravelTime,
      int? freeFlowTravelTime,
      int? confidence,
      bool? roadClosure,
      Map<String, dynamic>? coordinates}) = _FlowSegmentData;

  factory FlowSegmentData.fromJson(Map<String, dynamic> json) =>
      _$FlowSegmentDataFromJson(json);
}

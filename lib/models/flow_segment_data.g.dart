// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_segment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlowSegmentData _$_$_FlowSegmentDataFromJson(Map<String, dynamic> json) {
  return _$_FlowSegmentData(
    frc: json['frc'] as String?,
    currentSpeed: json['currentSpeed'] as int?,
    freeFlowSpeed: json['freeFlowSpeed'] as int?,
    currentTravelTime: json['currentTravelTime'] as int?,
    freeFlowTravelTime: json['freeFlowTravelTime'] as int?,
    confidence: json['confidence'] as int?,
    roadClosure: json['roadClosure'] as bool?,
    coordinates: json['coordinates'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$_$_FlowSegmentDataToJson(_$_FlowSegmentData instance) =>
    <String, dynamic>{
      'frc': instance.frc,
      'currentSpeed': instance.currentSpeed,
      'freeFlowSpeed': instance.freeFlowSpeed,
      'currentTravelTime': instance.currentTravelTime,
      'freeFlowTravelTime': instance.freeFlowTravelTime,
      'confidence': instance.confidence,
      'roadClosure': instance.roadClosure,
      'coordinates': instance.coordinates,
    };

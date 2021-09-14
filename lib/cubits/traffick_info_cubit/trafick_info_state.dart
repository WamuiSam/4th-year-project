part of 'trafick_info_cubit.dart';

@freezed
abstract class TrafickInfoState extends Equatable {}

class TrafickInfoInitial extends TrafickInfoState {
  @override
  List<Object?> get props => [];
}

class TrafickInfoLoading extends TrafickInfoState {
  @override
  List<Object?> get props => [];
}

class TrafickInfoSuccess extends TrafickInfoState {
  final FlowSegmentData flowSegmentData;

  TrafickInfoSuccess(this.flowSegmentData);
  @override
  List<Object?> get props => [flowSegmentData];
}

class TrafickInfoFailed extends TrafickInfoState {
  final String failed;

  TrafickInfoFailed(this.failed);
  @override
  List<Object?> get props => [failed];
}

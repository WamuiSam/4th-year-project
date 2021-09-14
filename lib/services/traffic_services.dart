import 'package:dio/dio.dart';
import 'package:wamui/models/flow_segment_data.dart';

class TrafficServices {
  static Future<FlowSegmentData> getFlowSegmentData(
      {required int versionNumber,
      required String style,
      required int zoom,
      required double latitude,
      required double longitude}) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
          'https://api.tomtom.com/traffic/services/$versionNumber/flowSegmentData/relative0/$zoom/json');
      return FlowSegmentData.fromJson(response.data['flowSegmentData']);
    } catch (e) {
      throw e.toString();
    }
  }
}

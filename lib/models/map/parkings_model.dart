// ignore: file_names
import 'dart:convert';

import 'markers_model.dart';

ParkingsModel parkingsModelJson(String str) =>
    ParkingsModel.fromJson(json.decode(str));

class ParkingsModel {
  ParkingsModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  ParkingsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final data0 = <String, dynamic>{};
    data0['message'] = message;
    data0['data'] = data.toJson();
    return data0;
  }
}

class Data {
  Data({
    required this.markers,
  });
  late final List<MarkerModel> markers;

  Data.fromJson(List<dynamic> json) {
    markers = markerFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    for (int i = 0; i < markers.length; i++) {
      data[''] = markers[i].toJson();
    }
    return data;
  }
}

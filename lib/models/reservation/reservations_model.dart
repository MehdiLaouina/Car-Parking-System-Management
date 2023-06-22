// ignore: file_names
import 'dart:convert';

import 'package:application/models/reservation/reservation_model.dart';

ReservationsModel reservationsModelJson(String str) =>
    ReservationsModel.fromJson(json.decode(str));

class ReservationsModel {
  ReservationsModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  ReservationsModel.fromJson(Map<String, dynamic> json) {
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
    required this.reservations,
  });
  late final List<ReservationModel> reservations;

  Data.fromJson(List<dynamic> json) {
    reservations = reservationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    for (int i = 0; i < reservations.length; i++) {
      data[''] = reservations[i].toJson();
    }
    return data;
  }
}

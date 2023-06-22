List<MarkerModel> markerFromJson(dynamic str) =>
    List<MarkerModel>.from((str).map((x) => MarkerModel.fromJson(x)));

class MarkerModel {
  late int id_parking;
  late String adresse;
  late int total_spots;
  late int available_spots;
  late Duration open_time;
  late Duration close_time;
  late int id_Admin;
  late double longitude;
  late double latitude;
  late double Prix_spot;

  MarkerModel(
      {required this.id_parking,
      required this.adresse,
      required this.total_spots,
      required this.available_spots,
      required this.open_time,
      required this.close_time,
      required this.id_Admin,
      required this.longitude,
      required this.latitude,
      required this.Prix_spot});

  MarkerModel.fromJson(Map<String, dynamic> json) {
    id_parking = json['Id_parking'];
    adresse = json['Adresse'];
    total_spots = json['Total_spots'];
    available_spots = json['Available_spots'];
    Map<String, int> duration = timeToDuration(json['Open_time']);
    open_time = Duration(
        hours: duration['hours'] ?? 00,
        minutes: duration['minutes'] ?? 00,
        seconds: duration['seconds'] ?? 00);
    Map<String, int> duration2 = timeToDuration(json['Close_time']);
    close_time = Duration(
        hours: duration2['hours'] ?? 00,
        minutes: duration2['minutes'] ?? 00,
        seconds: duration2['seconds'] ?? 00);
    id_Admin = json['Id_Admin'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    Prix_spot = json['Prix_spot'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id_parking'] = id_parking;
    data['Adresse'] = adresse;
    data['Total_spots'] = total_spots;
    data['Available_spots'] = available_spots;
    data['Open_time'] = durationToTime(open_time);
    data['Close_time'] = durationToTime(close_time);
    data['Id_Admin'] = id_Admin;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['Prix_spot'] = Prix_spot;
    return data;
  }

  static Map<String, int> timeToDuration(String str) {
    final timeParts = str.split(':');
    final hours = int.parse(timeParts[0]);
    final minutes = int.parse(timeParts[1]);
    final seconds = int.parse(timeParts[2]);
    return {'hours': hours, 'minutes': minutes, 'seconds': seconds};
  }

  static String durationToTime(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    return '$hours:$minutes:$seconds';
  }
}

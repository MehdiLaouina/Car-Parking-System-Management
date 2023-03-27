import 'dart:convert';

AdminLoginResponseModel adminLoginResponseJson(String str) =>
    AdminLoginResponseModel.fromJson(json.decode(str));

class AdminLoginResponseModel {
  AdminLoginResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  AdminLoginResponseModel.fromJson(Map<String, dynamic> json) {
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
    required this.email,
    required this.token,
  });
  late final String email;
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    token = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['accessToken'] = token;
    return data;
  }
}

import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
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
  String token = '';

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

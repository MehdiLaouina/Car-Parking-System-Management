import 'dart:convert';

AdminRegisterResponseModel adminRegisterResponseModel(String str) =>
    AdminRegisterResponseModel.fromJson(json.decode(str));

class AdminRegisterResponseModel {
  AdminRegisterResponseModel({
    required this.message,
  });
  late final String message;

  AdminRegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}

import 'dart:convert';

Admin adminJson(String str) => Admin.fromJson(json.decode(str));

class Admin {
  Admin({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  Admin.fromJson(Map<String, dynamic> json) {
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
    required this.id,
    required this.name,
    required this.email,
  });
  late final int id;
  late final String name;
  late final String email;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class AdminRegisterRequestModel {
  AdminRegisterRequestModel({
    required this.name,
    required this.password,
    required this.email,
  });
  late final String name;
  late final String password;
  late final String email;

  AdminRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}

class RegisterRequestModel {
  RegisterRequestModel({
    required this.name,
    required this.password,
    required this.email,
    required this.vehicule,
    required this.immatriculation,
    required this.solde,
    // ignore: non_constant_identifier_names
    required this.payment_method,
  });
  late final String name;
  late final String password;
  late final String email;
  late final String vehicule;
  late final String immatriculation;
  late final bool isBanned;
  late final double solde;
  // ignore: non_constant_identifier_names
  late final String payment_method;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    email = json['email'];
    vehicule = json['vehicule'];
    immatriculation = json['immatriculation'];
    isBanned = json['isBanned'];
    solde = json['solde'];
    payment_method = json['methodePaiment'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    data['email'] = email;
    data['vehicule'] = vehicule;
    data['immatriculation'] = immatriculation;
    data['isBanned'] = false;
    data['solde'] = solde;
    data['methodePaiment'] = payment_method;
    return data;
  }
}

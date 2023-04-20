// ignore: file_names
import 'dart:convert';

Client clientJson(String str) => Client.fromJson(json.decode(str));

class Client {
  Client({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  Client.fromJson(Map<String, dynamic> json) {
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
    required this.vehicule,
    // ignore: non_constant_identifier_names
    required this.N_immatriculation,
    required this.solde,
    required this.methodePayement,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String vehicule;
  // ignore: non_constant_identifier_names
  late final String N_immatriculation;
  late final double solde;
  late final String methodePayement;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    vehicule = json['vehicule'];
    N_immatriculation = json['immatriculation'];
    solde = json['solde'];
    methodePayement = json['methodePaiment'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['vehicule'] = vehicule;
    data['immatriculation'] = N_immatriculation;
    data['solde'] = solde;
    data['methodePaiment'] = methodePayement;
    return data;
  }
}

List<ReservationModel> reservationFromJson(dynamic str) =>
    List<ReservationModel>.from((str).map((x) => ReservationModel.fromJson(x)));

class ReservationModel {
  late int Id_reservation;
  late DateTime Entry_date;
  late DateTime Exit_date;
  late double Rate;
  late bool Status_paiement;
  late int Id_client;
  late int Id_facture;
  late int Id_spot;
  late int Id_admin;

  ReservationModel(
      {required this.Id_reservation,
      required this.Entry_date,
      required this.Exit_date,
      required this.Rate,
      required this.Status_paiement,
      required this.Id_client,
      required this.Id_facture,
      required this.Id_spot,
      required this.Id_admin});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    Id_reservation = json['Id_reservation'];
    Entry_date = DateTime.parse(json['Entry_date']);
    Exit_date = DateTime.parse(json['Exit_date']);
    Rate = json['Rate'].toDouble();
    Status_paiement = json['Status_paiement'] == "0" ? false : true;
    Id_client = json['Id_client'];
    Id_facture = json['Id_facture'] ?? 0;
    Id_spot = json['Id_spot'];
    Id_admin = json['Id_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id_reservation'] = Id_reservation;
    data['Entry_date'] = Entry_date;
    data['Exit_date'] = Exit_date;
    data['Rate'] = Rate;
    data['Status_paiement'] = Status_paiement;
    data['Id_client'] = Id_client;
    data['Id_facture'] = Id_facture;
    data['Id_spot'] = Id_spot;
    data['Id_admin'] = Id_admin;
    return data;
  }
}

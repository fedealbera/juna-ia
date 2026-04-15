class PlacaModel {
  String? dni;
  String? nroPlaca;
  String? idEvento;
  String? idOrg;
  String? token;

  PlacaModel();

  Map<String, dynamic> toMap() => {
        "dni": dni,
        "nroPlaca": nroPlaca,
        "idEvento": idEvento,
        "idOrg": idOrg,
        "token": token,
      };
}

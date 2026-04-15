class TokenModel {
  String? idOrg;
  String? idEvento;
  String? token;
  String? documento;

  TokenModel();

  Map<String, dynamic> toMap() => {
        "idOrg": idOrg,
        "idEvento": idEvento,
        "token": token,
        "documento": documento,
      };
}

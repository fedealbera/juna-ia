class SettingModel {
  late String clave;
  String? valor;

  SettingModel();

  Map<String, dynamic> toMap() => {
        "clave": clave,
        "valor": valor,
      };

  SettingModel.fromMap(Map<String, dynamic> json) {
    clave = json["clave"] == null ? "" : json["clave"];
    valor = json["valor"] == null ? "" : json["valor"];
  }
}

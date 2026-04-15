class MensajeModel {
  late String id;
  late String titulo;
  late String mensaje;
  late String fechaHora;
  late String leido;

  MensajeModel();

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "mensaje": mensaje,
        "fecha_hora": fechaHora,
        "leido": leido,
      };

  MensajeModel.fromMap(Map<String, dynamic> json) {
    id = json["id"] == null ? "" : json["id"];
    titulo = json["titulo"] == null ? "" : json["titulo"];
    mensaje = json["mensaje"] == null ? "" : json["mensaje"];
    fechaHora = json["fecha_hora"] ?? "";
    leido = json["leido"] == null ? "" : json["leido"];
  }
}

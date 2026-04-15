class TalleModel {
  late String id;
  late String codigo;
  late String nombre;

  TalleModel({
    this.id = "",
    this.codigo = "",
    this.nombre = "",
  });

  TalleModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    codigo = parsedJson['codigo'];
    nombre = parsedJson['nombre'];
  }

  Map<String, dynamic> toMap() => {
        "categId": id,
        "codigo": codigo,
        "nombre": nombre,
      };
}

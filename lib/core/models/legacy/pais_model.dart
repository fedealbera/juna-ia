class PaisModel {
  late String id;
  late String nombre;

  PaisModel({
    this.id = "",
    this.nombre = "",
  });

  PaisModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    nombre = parsedJson['nombre'];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
      };
}

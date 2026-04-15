class ProvinciaModel {
  late String id;
  late String nombre;

  ProvinciaModel({
    this.id = "",
    this.nombre = "",
  });

  ProvinciaModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    nombre = parsedJson['nombre'];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
      };
}

class DocumentationModel {
  late String nombre;
  late String public;
  late String estado;
  late String descripcion;
  late String fecha;

  DocumentationModel();

  DocumentationModel.fromJson(Map<String, dynamic> parsedJson) {
    nombre = parsedJson['nombre'] ?? "";
    public = parsedJson['public'] ?? "";
    estado = parsedJson['estado'] ?? "";
    descripcion = parsedJson['descripcion'] ?? "";
    fecha = parsedJson['fecha'] ?? "";
  }

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "public": public,
        "estado": estado,
        "descripcion": descripcion,
        "fecha": fecha,
      };
}

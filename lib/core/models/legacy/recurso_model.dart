class RecursoModel {
  late String id;
  late String nombre;
  late String tipoArchivo;
  late String nombreCorto;
  late String descripcion;
  late String tipoContenido;
  late String nombreArchivo;
  late String link;
  late String extLink;

  RecursoModel();

  RecursoModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    nombre = parsedJson['nombre'];
    tipoArchivo = parsedJson['tipoArchivo'];
    nombreCorto = parsedJson['nombreCorto'];
    descripcion = parsedJson['descripcion'];
    tipoContenido = parsedJson['tipoContenido'];
    nombreArchivo = parsedJson['nombreArchivo'];
    link = parsedJson['link'];
    extLink = parsedJson['extLink'];
  }
}

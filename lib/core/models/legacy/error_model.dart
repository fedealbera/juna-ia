class ErrorResponseModel {
  String? codigo;
  String? nombre;
  String? descripcion;

  ErrorResponseModel.fromJson(Map<String, dynamic> error) {
    codigo = error['codigo'];
    nombre = error['nombre'];
    descripcion = error['descripcion'];
  }
}

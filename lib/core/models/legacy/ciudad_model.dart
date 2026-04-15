class CiudadModel {
  late String id;
  late String idPais;
  late String idProvincia;
  late String nombre;

  CiudadModel({
    this.id = "",
    this.idPais = "",
    this.idProvincia = "",
    this.nombre = "",
  });

  CiudadModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    idPais = parsedJson['idPais'];
    idProvincia = parsedJson['idProvincia'];
    nombre = parsedJson['nombre'];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "idPais": idPais,
        "idProvincia": idProvincia,
        "nombre": nombre,
      };

  @override
  String toString() {
    return 'CiudadModel('
        'id: $id, '
        'idPais: $idPais, '
        'idProvincia: $idProvincia, '
        'nombre: $nombre'
        ')';
  }
}

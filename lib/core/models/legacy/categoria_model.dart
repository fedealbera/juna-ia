class CategoriaModel {
  late String categId;
  late String categCod;
  late String categNombre;
  late String categNombreCorto;
  late String categDescripcion;
  late String categLargada;
  late String categCircuitoId;

  CategoriaModel({
    this.categId = "",
    this.categCod = "",
    this.categNombre = "",
    this.categNombreCorto = "",
    this.categDescripcion = "",
    this.categLargada = "",
    this.categCircuitoId = "",
  });

  CategoriaModel.fromJson(Map<String, dynamic> parsedJson) {
    categId = parsedJson['categId'];
    categCod = parsedJson['categCod'];
    categNombre = parsedJson['categNombre'];
    categNombreCorto = parsedJson['categNombreCorto'];
    categDescripcion = parsedJson['categDescripcion'];
    categLargada = parsedJson['categLargada'];
    categCircuitoId = parsedJson['categCircuitoId'];
  }

  Map<String, dynamic> toMap() => {
        "categId": categId,
        "categCod": categCod,
        "categNombre": categNombre,
        "categNombreCorto": categNombreCorto,
        "categDescripcion": categDescripcion,
        "categLargada": categLargada,
        "categCircuitoId": categCircuitoId,
      };
}

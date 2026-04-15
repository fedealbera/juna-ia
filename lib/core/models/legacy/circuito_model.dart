class CircuitoModel {
  late String circuitoId;
  late String circuitoCod;
  late String circuitoNombre;
  late String circuitoNombreCorto;
  late String circuitoCupo;
  late String tipoCircuitoId;
  late String circuitoPrecioGral;

  CircuitoModel({
    this.circuitoId = "",
    this.circuitoCod = "",
    this.circuitoNombre = "",
    this.circuitoNombreCorto = "",
    this.circuitoCupo = "",
    this.tipoCircuitoId = "",
    this.circuitoPrecioGral = "",
  });

  CircuitoModel.fromJson(Map<String, dynamic> parsedJson) {
    circuitoId = parsedJson['circuitoId'];
    circuitoCod = parsedJson['circuitoCod'];
    circuitoNombre = parsedJson['circuitoNombre'];
    circuitoNombreCorto = parsedJson['circuitoNombreCorto'];
    circuitoCupo = parsedJson['circuitoCupo'];
    tipoCircuitoId = parsedJson['tipoCircuitoId'];
    circuitoPrecioGral = parsedJson['circuitoPrecioGral'];
  }

  Map<String, dynamic> toMap() => {
        "circuitoId": circuitoId,
        "circuitoCod": circuitoCod,
        "circuitoNombre": circuitoNombre,
        "circuitoNombreCorto": circuitoNombreCorto,
        "circuitoCupo": circuitoCupo,
        "tipoCircuitoId": tipoCircuitoId,
        "circuitoPrecioGral": circuitoPrecioGral,
      };
}

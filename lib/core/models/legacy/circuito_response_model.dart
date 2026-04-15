import 'package:churo_mobile/core/models/legacy/circuito_model.dart';

class CircuitoResponseModel {
  late List<CircuitoModel> circuitos;
  Error? error;

  CircuitoResponseModel();

  CircuitoResponseModel.fromJson(Map<String, dynamic> contenidoData) {
    if (contenidoData['categorias'] != null) {
      circuitos = (contenidoData['categorias'] as List).map((item) => CircuitoModel.fromJson(item)).toList();
    } else {
      circuitos = [];
    }

    // Mapear el campo "error" (puede venir null)
    error = contenidoData['error'];
  }
}

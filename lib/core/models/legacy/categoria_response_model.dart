import 'package:churo_mobile/core/models/legacy/categoria_model.dart';

class CategoriaResponseModel {
  late List<CategoriaModel> categorias;
  Error? error;

  CategoriaResponseModel();

  CategoriaResponseModel.fromJson(Map<String, dynamic> contenidoData) {
    if (contenidoData['categorias'] != null) {
      categorias = (contenidoData['categorias'] as List).map((item) => CategoriaModel.fromJson(item)).toList();
    } else {
      categorias = [];
    }

    // Mapear el campo "error" (puede venir null)
    error = contenidoData['error'];
  }
}

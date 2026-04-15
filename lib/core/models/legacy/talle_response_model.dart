import 'package:churo_mobile/core/models/legacy/talle_model.dart';

class TalleResponseModel {
  late List<TalleModel> talles;
  Error? error;

  TalleResponseModel();

  TalleResponseModel.fromJson(Map<String, dynamic> contenidoData) {
    if (contenidoData['categorias'] != null) {
      talles = (contenidoData['categorias'] as List).map((item) => TalleModel.fromJson(item)).toList();
    } else {
      talles = [];
    }

    // Mapear el campo "error" (puede venir null)
    error = contenidoData['error'];
  }
}

import 'package:churo_mobile/core/models/legacy/pais_model.dart';

class PaisResponseModel {
  late List<PaisModel> paises;

  PaisResponseModel.fromJson(List<dynamic> contenidoData) {
    paises = contenidoData.map((item) => PaisModel.fromJson(item)).toList();
  }
}

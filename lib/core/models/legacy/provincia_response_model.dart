import 'package:churo_mobile/core/models/legacy/provincia_model.dart';

class ProvinciaResponseModel {
  late List<ProvinciaModel> provincias;

  ProvinciaResponseModel.fromJson(List<dynamic> contenidoData) {
    provincias = contenidoData.map((item) => ProvinciaModel.fromJson(item)).toList();
  }
}

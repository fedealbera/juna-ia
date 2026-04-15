import 'package:churo_mobile/core/models/legacy/ciudad_model.dart';

class CiudadResponseModel {
  late List<CiudadModel> ciudades;

  CiudadResponseModel.fromJson(List<dynamic> contenidoData) {
    ciudades = contenidoData.map((item) => CiudadModel.fromJson(item)).toList();
  }
}

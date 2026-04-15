import 'package:churo_mobile/core/models/legacy/corredor_model.dart';

class CorredorResponseModel {
  Map? error;
  CorredorModel? corredor;

  CorredorResponseModel.fromJson(contenidoData) {
    this.error = contenidoData['error'];
    if (this.error == null) {
      corredor = CorredorModel.fromJson(contenidoData['corredor']);
    }
  }
}

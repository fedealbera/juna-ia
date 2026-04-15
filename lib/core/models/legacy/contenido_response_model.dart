import 'package:churo_mobile/core/models/legacy/recurso_model.dart';

class ContenidoResponseModel {
  Error? error;
  late List<RecursoModel> archivos;

  ContenidoResponseModel.fromJson(contenidoData) {
    this.error = contenidoData['error'];
    if (this.error == null) {
      List<RecursoModel> tmpRecursos = [];
      for (int i = 0; i < contenidoData['archivos'].length; i++) {
        RecursoModel recursoModel = RecursoModel.fromJson(contenidoData['archivos'][i]);
        tmpRecursos.add(recursoModel);
      }
      archivos = tmpRecursos;
    }
  }
}

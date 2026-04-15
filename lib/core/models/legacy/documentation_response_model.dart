import 'package:churo_mobile/core/models/legacy/documentation_model.dart';

class DocumentationResponseModel {
  late bool success;
  late String error;
  late Map<String, DocumentationModel> archivos;

  DocumentationResponseModel.fromJson(documentationData) {
    Map<String, DocumentationModel> archivosMap = {};
    if (documentationData.containsKey('error')) {
      this.error = documentationData['error'];
    }
    // this.error = documentationData.containsKey('error') ? documentationData['error'] : null;
    this.success = documentationData['success'];
    if (documentationData['archivos'] != null) {
      (documentationData['archivos'] as Map<String, dynamic>).forEach((key, value) {
        if (value != null && value is Map && value.isNotEmpty) {
          archivosMap[key] = DocumentationModel.fromJson(
            Map<String, dynamic>.from(value),
          );
        }
      });
    }
    this.archivos = archivosMap;
  }
}

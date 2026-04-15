import 'package:churo_mobile/core/models/legacy/setting_model.dart';

class SettingResponseModel {
  Error? error;
  late List<SettingModel> settings;
  late Map<String, String> settingsMap = Map();

  SettingResponseModel.fromJson(settingData) {
    this.error = settingData['error'];
    if (this.error == null) {
      List<SettingModel> tmpRecursos = [];
      for (int i = 0; i < settingData['settings'].length; i++) {
        SettingModel recursoModel = SettingModel.fromMap(settingData['settings'][i]);
        tmpRecursos.add(recursoModel);
        settingsMap[recursoModel.clave] = recursoModel.valor!;
      }
      settings = tmpRecursos;
    }
  }
}

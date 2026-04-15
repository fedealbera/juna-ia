import '../../domain/entities/setting_entity.dart';

class SettingModel extends SettingEntity {
  const SettingModel({
    required super.clave,
    required super.valor,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    return SettingModel(
      clave: json['clave'] ?? '',
      valor: json['valor'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clave': clave,
      'valor': valor,
    };
  }
}

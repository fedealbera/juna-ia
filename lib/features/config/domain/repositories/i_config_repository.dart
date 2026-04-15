import '../entities/setting_entity.dart';

abstract class IConfigRepository {
  Future<List<SettingEntity>> getSettings(String idOrganizacion, String eventoId);
}

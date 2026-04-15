import '../../domain/entities/setting_entity.dart';
import '../../domain/repositories/i_config_repository.dart';

class GetSettingsUseCase {
  final IConfigRepository repository;

  GetSettingsUseCase(this.repository);

  Future<List<SettingEntity>> call(String idOrganizacion, String eventoId) {
    return repository.getSettings(idOrganizacion, eventoId);
  }
}

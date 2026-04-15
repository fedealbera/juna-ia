import 'package:hive/hive.dart';
import '../../domain/entities/setting_entity.dart';
import '../../domain/repositories/i_config_repository.dart';
import '../datasources/config_remote_data_source.dart';
import '../models/setting_model.dart';

class ConfigRepositoryImpl implements IConfigRepository {
  final IConfigRemoteDataSource remoteDataSource;
  final Box<dynamic> cacheBox;

  static const String _settingsCacheKey = 'CACHED_SETTINGS';

  ConfigRepositoryImpl({
    required this.remoteDataSource,
    required this.cacheBox,
  });

  @override
  Future<List<SettingEntity>> getSettings(String idOrganizacion, String eventoId) async {
    try {
      final remoteSettings = await remoteDataSource.getSettings(idOrganizacion, eventoId);
      
      // Map to JSON for caching
      final settingsJson = remoteSettings.map((e) => e.toJson()).toList();
      await cacheBox.put('${_settingsCacheKey}_${idOrganizacion}_$eventoId', settingsJson);
      
      return remoteSettings;
    } catch (e) {
      // Fallback to offline cache
      if (cacheBox.containsKey('${_settingsCacheKey}_${idOrganizacion}_$eventoId')) {
        final List<dynamic> cachedData = cacheBox.get('${_settingsCacheKey}_${idOrganizacion}_$eventoId');
        return cachedData.map((json) => SettingModel.fromJson(Map<String,dynamic>.from(json))).toList();
      }
      throw Exception('Failed to get settings from network and no cache available.');
    }
  }
}

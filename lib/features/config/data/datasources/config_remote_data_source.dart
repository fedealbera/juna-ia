import 'package:dio/dio.dart';
import '../models/setting_model.dart';

abstract class IConfigRemoteDataSource {
  Future<List<SettingModel>> getSettings(String idOrganizacion, String eventoId);
}

class ConfigRemoteDataSourceImpl implements IConfigRemoteDataSource {
  final Dio dio;

  ConfigRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<SettingModel>> getSettings(String idOrganizacion, String eventoId) async {
    // TODO: move base URL to env or proper config
    final String url = 'https://api-placeholder.com/settings/$idOrganizacion/$eventoId'; 
    
    try {
      final response = await dio.get(url);
      
      // Based on SettingResponseModel from legacy provider
      if (response.data['error'] == null && response.data['settings'] != null) {
        final List<dynamic> settingsList = response.data['settings'];
        return settingsList.map((json) => SettingModel.fromJson(json)).toList();
      } else {
        throw Exception('Error loading settings: ${response.data['error']}');
      }
    } catch (e) {
      throw Exception('Failed to load settings data: $e');
    }
  }
}

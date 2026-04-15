import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import '../../features/config/data/datasources/config_remote_data_source.dart';
import '../../features/config/data/repositories/config_repository_impl.dart';
import '../../features/config/domain/repositories/i_config_repository.dart';
import '../../features/config/domain/usecases/get_settings_usecase.dart';
import '../../features/config/presentation/bloc/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Config
  // Bloc
  sl.registerFactory(() => ThemeBloc());

  // Use cases
  sl.registerLazySingleton(() => GetSettingsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<IConfigRepository>(
    () => ConfigRepositoryImpl(remoteDataSource: sl(), cacheBox: sl()),
  );

  // Data sources
  sl.registerLazySingleton<IConfigRemoteDataSource>(
    () => ConfigRemoteDataSourceImpl(dio: sl()),
  );

  // Core
  sl.registerLazySingleton(() => Dio());
  // Hive box specific to config
  final configBox = await Hive.openBox<dynamic>('config_box');
  sl.registerLazySingleton<Box<dynamic>>(() => configBox);
  
  // External
}

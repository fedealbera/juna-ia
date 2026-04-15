import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/di/injection_container.dart' as di;
import 'features/config/presentation/bloc/theme_bloc.dart';
import 'features/config/presentation/bloc/theme_event.dart';
import 'features/config/presentation/bloc/theme_state.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1. Initialize Hive for generic offline persistence
  await Hive.initFlutter();

  // 2. Initialize HydratedBloc for offline BLoC states
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path),
  );

  // 3. Initialize Dependency Injection
  await di.init();

  // TODO: Initialize Firebase when multitenant keys are provided
  // await Firebase.initializeApp(...);

  runApp(const ChuroApp());
}

class ChuroApp extends StatelessWidget {
  const ChuroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => di.sl<ThemeBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Churo Mobile',
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}

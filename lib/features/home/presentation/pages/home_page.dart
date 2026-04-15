import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:churo_mobile/core/widgets/app_drawer.dart';
import 'package:churo_mobile/features/config/presentation/bloc/theme_bloc.dart';
import 'package:churo_mobile/features/config/presentation/bloc/theme_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Churo White Label'),
      ),
      body: Container(
        color: Colors.grey.shade200, // Fondo liso temporal
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.terrain, size: 100, color: Colors.grey),
              const SizedBox(height: 20),
              const Text(
                'Bienvenido a la Competición',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Este es el Home temporal con color liso.\\nAbrí el menú superior izquierdo para ir a Inscripciones.',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(LoadMockThemeEvent());
                },
                child: const Text('Cargar Theme de Prueba'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

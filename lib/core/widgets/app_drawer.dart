import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black87, // TODO: link with ThemeBloc in future
            ),
            child: Text(
              'Churo Mobile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ExpansionTile(
            leading: const Icon(Icons.app_registration),
            title: const Text('Inscripciones'),
            children: [
              ListTile(
                leading: const Icon(Icons.web),
                title: const Text('Formulario Web'),
                onTap: () {
                  // Cerrar el drawer
                  Navigator.pop(context);
                  // Navegar a la webview con los parámetros
                  final url = Uri.encodeComponent('https://juna.net.ar/desafio2026/');
                  final title = Uri.encodeComponent('Inscripción Web');
                  context.push('/webview?url=$url&title=$title');
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_search),
                title: const Text('Ver Inscripción'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Implementar búsqueda por DNI
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Próximamente: Búsqueda por DNI')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

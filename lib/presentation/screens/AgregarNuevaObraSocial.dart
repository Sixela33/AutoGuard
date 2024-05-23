import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarNuevaObraSocial extends StatelessWidget {
  static String name = 'Agregar obra social';
  const AgregarNuevaObraSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return _AgregarNuevaObraSocial();
  }
}

class _AgregarNuevaObraSocial extends ConsumerWidget {
  _AgregarNuevaObraSocial({
    super.key,
  });

  final TextEditingController nombreNuevaObraSocial = TextEditingController();
  final TextEditingController nombreNuevaEspecialidad = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final databaseNotifier = ref.watch(databaseNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cargar obra social y especialidad"),
      ),
      body: Column(
        children: [
          const Text("Insertar nombre de la obra social: "),
          TextField(
            controller: nombreNuevaObraSocial,
            decoration: const InputDecoration(
              hintText: 'Nombre',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          FilledButton(
            onPressed: () async {
              await databaseNotifier.addObraSocial(nombreNuevaObraSocial.text);
            },
            child: const Text("Guardar Obra Social"),
          ),
          const SizedBox(height: 10),
          const Text("Insertar nombre de la especialidad: "),
          TextField(
            controller: nombreNuevaEspecialidad,
            decoration: const InputDecoration(
              hintText: 'Nombre',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          FilledButton(
              onPressed: () async {
                await databaseNotifier.addEspecialidad(nombreNuevaEspecialidad.text);
              },
              child: const Text("Guardar Especialidad"),
          ),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () {}, 
            child: Text('Añadir Medico'))
        ],
      ),
    );
  }
}

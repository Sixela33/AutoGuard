import 'package:autoguard/presentation/components/CustomPopup.dart';
import 'package:autoguard/presentation/entities/ResponseObject.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:autoguard/presentation/screens/RegistrarMedico.dart';

class AdminScreen extends StatelessWidget {
  static String name = 'Agregar obra social';
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _AdminScreen();
  }
}

class _AdminScreen extends ConsumerWidget {
  _AdminScreen({
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                ResponseObject res = await databaseNotifier.addObraSocial(nombreNuevaObraSocial.text);
                nombreNuevaObraSocial.clear;
                showDialog(
                  context: context, 
                  builder: (context) {
                    return CustomPopup(title: res.mensaje, content: res.mensaje);
                  });
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
                  ResponseObject res = await databaseNotifier.addEspecialidad(nombreNuevaEspecialidad.text);
                  nombreNuevaEspecialidad.clear();
                  showDialog(
                  context: context, 
                  builder: (context) {
                    return CustomPopup(title: res.mensaje, content: res.mensaje);
                  });
                },
                child: const Text("Guardar Especialidad"),
            ),
            const SizedBox(height: 10),
            FilledButton(
              
              onPressed: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      
                     },
                   ),
                 ); */
              }, 
              child: Text('Añadir Medico'))
          ],
        ),
      ),
    );
  }
}

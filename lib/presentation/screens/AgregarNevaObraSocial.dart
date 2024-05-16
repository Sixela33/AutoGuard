import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarObraSocial extends StatelessWidget {
    static String name = 'Agregar obra social';
  const AgregarObraSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return _AgregarObraSocial();
  }
}

class _AgregarObraSocial extends ConsumerWidget {
  _AgregarObraSocial({
    super.key,
  });

  final TextEditingController nombreNuevaObraSocial = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final databaseNotifier = ref.watch(databaseNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cargar obra social"),),
        body: Column(
          children: [
            const Text("Insertar nombre dela la obra social: "),
            TextField(
              controller: nombreNuevaObraSocial,
              decoration: const InputDecoration(
                hintText: 'Nombre',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
              ),
            ),
            FilledButton(
              onPressed: () async {
                await databaseNotifier.addObraSocial(nombreNuevaObraSocial.text);
              }, 
              child: Text("Guardar"))
            
          ],
        ),  
      );
  }
}
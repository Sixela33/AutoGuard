import 'package:autoguard/presentation/entities/DataEntities/ObraSocial.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final obraSocialSeleccionadaProvider = StateProvider<ObraSocial?>((ref) => null);

class AgregarObraSocial extends StatelessWidget {
  const AgregarObraSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AgregarObraSocial();
  }
}

class _AgregarObraSocial extends ConsumerStatefulWidget {
  const _AgregarObraSocial();

  @override
  _AgregarObraSocialState createState() => _AgregarObraSocialState();
}

class _AgregarObraSocialState extends ConsumerState<_AgregarObraSocial> {
  final TextEditingController numeroObraSocialController = TextEditingController();

  @override
  void dispose() {
    numeroObraSocialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final databaseProvider = ref.watch(databaseNotifierProvider);
    databaseProvider.getObrasSociales();
    
    ObraSocial? obraSocialSeleccionada;
    if (databaseProvider.obrasSociales.isNotEmpty) {
      obraSocialSeleccionada = databaseProvider.obrasSociales[0];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar obra social"),
      ),
      body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Seleccioná tu obra social:"),
                DropdownButtonFormField<ObraSocial>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  hint: const Text("elige tu obra social"),
                  value: obraSocialSeleccionada,
                  onChanged: (ObraSocial? newValue) {
                    ref.read(obraSocialSeleccionadaProvider.notifier).state = newValue;
                  },
                  items: databaseProvider.obrasSociales.map((ObraSocial value) {
                    return DropdownMenuItem<ObraSocial>(
                      value: value,
                      child: Text(value.nombre),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
                const Text("Ingresa tu número de obra social:"),
                TextField(
                  controller: numeroObraSocialController,
                  decoration: const InputDecoration(
                    hintText: 'Número de obra social',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: FilledButton(
                    onPressed: () {
                      final obraSocial = ref.read(obraSocialSeleccionadaProvider);
                      final numeroObraSocial = numeroObraSocialController.text;
                      if (obraSocial != null && numeroObraSocial.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Obra social guardada: ${obraSocial.nombre} - $numeroObraSocial')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Por favor, completá todos los campos')),
                        );
                      }
                    },
                    child: const Text("Guardar"),
                  ),
                ),
              ],
            ),
          )
    );
  }
}

import 'package:flutter/material.dart';

class AgregarObraSocial extends StatefulWidget {
  static String name = "Agregar Obra Social";

  const AgregarObraSocial({super.key});

  @override
  State<AgregarObraSocial> createState() => _AgregarObraSocialState();
}

class _AgregarObraSocialState extends State<AgregarObraSocial> {
  final TextEditingController numeroObraSocialController = TextEditingController();
  String? obraSocialSeleccionada;

  final List<String> obrasSociales = [
    'OSDE',
    'Swiss Medical',
    'Galeno',
    'Medifé',
    'IOMA',
    'PAMI',
    'Hospital Italiano'
  ];

  @override
  Widget build(BuildContext context) {
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
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: 'Obra Social',
              ),
              value: obraSocialSeleccionada,
              onChanged: (String? newValue) {
                setState(() {
                  obraSocialSeleccionada = newValue;
                });
              },
              items: obrasSociales.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
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
                  final obraSocial = obraSocialSeleccionada;
                  final numeroObraSocial = numeroObraSocialController.text;
                  if (obraSocial != null && numeroObraSocial.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Obra social guardada: $obraSocial - $numeroObraSocial')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Por favor, completá todos los campos')),
                    );
                  }
                },
                child: const Text("Guardar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

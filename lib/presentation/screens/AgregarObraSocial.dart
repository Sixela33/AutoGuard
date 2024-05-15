import 'package:flutter/material.dart';

class AgregarObraSocial extends StatefulWidget {
  static String name = "Agregar Obra Social";

  const AgregarObraSocial({super.key});

  @override
  State<AgregarObraSocial> createState() => _AgregarObraSocialState();
}

class _AgregarObraSocialState extends State<AgregarObraSocial> {

  static TextEditingController nombreNuevaObraSocial = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {}, 
              child: Text("Guardar"))
            
          ],
        ),  
      );
  }
}
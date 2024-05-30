import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:autoguard/presentation/entities/ObraSocial.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:autoguard/presentation/screens/LoginScreen.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  static String name = "Registrar usuario";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final TextEditingController controller_email = TextEditingController();
  final TextEditingController controller_password = TextEditingController();
  final List<ObraSocial> obrasSocialesSeleccionadas = [];

  @override
  Widget build(BuildContext context) {
    final databaseNotifier = ref.watch(databaseNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller_email,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: controller_password,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const Text("Seleccioná tus obras sociales:"),
            DropdownButton<ObraSocial>(
              hint: const Text('Seleccionar obra social'),
              value: null,
              onChanged: (selectedObraSocial) {
                if (selectedObraSocial != null) {
                  setState(() {
                    if (obrasSocialesSeleccionadas
                        .contains(selectedObraSocial)) {
                      obrasSocialesSeleccionadas.remove(selectedObraSocial);
                    } else {
                      obrasSocialesSeleccionadas.add(selectedObraSocial);
                    }
                  });
                }
              },
              items: databaseNotifier.obrasSociales.map((obraSocial) {
                return DropdownMenuItem<ObraSocial>(
                  value: obraSocial,
                  child: Text(obraSocial.nombre),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Wrap(
              children: obrasSocialesSeleccionadas.map((obraSocial) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      obrasSocialesSeleccionadas.remove(obraSocial);
                    });
                  },
                  child: Chip(
                    label: Text(obraSocial.nombre),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await databaseNotifier.registerWithEmailAndPassword(
                      controller_email.text, controller_password.text,
                      obrasSocialesSeleccionadas);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('¡Registro exitoso!')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error en el registro: $e')),
                  );
                }
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}

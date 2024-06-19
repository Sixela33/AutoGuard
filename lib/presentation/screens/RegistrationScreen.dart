import 'package:autoguard/presentation/entities/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:autoguard/presentation/entities/DataEntities/ObraSocial.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:autoguard/presentation/screens/LoginScreen.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  static String name = "Registrar usuario";

  const RegistrationScreen({Key? key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final List<ObraSocial> obrasSocialesSeleccionadas = [];

  @override
  Widget build(BuildContext context) {
    final databaseNotifier = ref.watch(databaseNotifierProvider);
    final themeProvider = ref.watch(themeNotifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: themeProvider.primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controllerEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controllerPassword,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            const Text("Seleccioná tus obras sociales:"),
            DropdownButton<ObraSocial>(
              hint: const Text('Seleccionar obra social'),
              value: null,
              onChanged: (selectedObraSocial) {
                if (selectedObraSocial != null) {
                  setState(() {
                    if (obrasSocialesSeleccionadas.contains(selectedObraSocial)) {
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await databaseNotifier.registerWithEmailAndPassword(
                      controllerEmail.text, controllerPassword.text,
                      obrasSocialesSeleccionadas);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('¡Registro exitoso!')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error en el registro: $e')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: themeProvider.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}

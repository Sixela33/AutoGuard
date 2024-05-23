import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:autoguard/presentation/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationScreen extends StatelessWidget {
  static String name = "Registrar usuario";

  @override
  Widget build(BuildContext context) {
    return _RegistrationScreen();
  }
}

class _RegistrationScreen extends ConsumerWidget {
  _RegistrationScreen({
    super.key,
  });

  final TextEditingController controller_email = TextEditingController();
  final TextEditingController controller_password = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await databaseNotifier.registerWithEmailAndPassword(
                    controller_email.text,
                    controller_password.text
                  );
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

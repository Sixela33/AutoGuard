import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:autoguard/presentation/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:autoguard/presentation/screens/RecuperarContrasenia.dart';

class LoginScreen extends StatelessWidget {
  static String name = "Iniciar sesión";

  @override
  Widget build(BuildContext context) {
    return _LoginScreen();
  }
}

class _LoginScreen extends ConsumerWidget {
  _LoginScreen({
    Key? key,
  });

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final databaseNotifier = ref.watch(databaseNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controllerEmail,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: controllerPassword,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await databaseNotifier.signInWithEmailAndPassword(
                    controllerEmail.text,
                    controllerPassword.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('¡Inicio de sesión exitoso!')),
                  );
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                     },
                   ),
                 );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al iniciar sesión: $e')),
                  );
                }
              },
              child: Text('Iniciar sesión'),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RecuperarContrasenia();
                    },
                  ),
                );
              },
              child: Text(
                'Olvidaste tu contraseña?',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
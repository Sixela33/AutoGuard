import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:autoguard/presentation/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:autoguard/presentation/screens/RecuperarContrasenia.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static String name = "Iniciar sesión";

  const LoginScreen({super.key});

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
        title: const Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controllerEmail,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: controllerPassword,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await databaseNotifier.signInWithEmailAndPassword(
                    controllerEmail.text,
                    controllerPassword.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('¡Inicio de sesión exitoso!')),
                  );
                  
                  context.push('/home');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al iniciar sesión: $e')),
                  );
                }
              },
              child: const Text('Iniciar sesión'),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RecuperarContrasenia();
                    },
                  ),
                );
              },
              child: const Text(
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

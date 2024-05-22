import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecuperarContrasenia extends StatefulWidget {
  const RecuperarContrasenia({Key? key}) : super(key: key);

  @override
  State<RecuperarContrasenia> createState() => _RecuperarContraseniaState();
}
class _RecuperarContraseniaState extends State<RecuperarContrasenia> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
}

  Future<void> enviarRecuperacion() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      _showSnackBar(
          'Si ese correo esta asociado a una cuenta de AutoGuard, se enviaron las instrucciones para recuperar la contraseña. Revisá tu bandeja de entrada o spam.');
    } catch (e) {
      print(e);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: enviarRecuperacion,
              child: Text('Recuperar contraseña'),
                ),
              ],
        ),
      ),
    );
  }
}
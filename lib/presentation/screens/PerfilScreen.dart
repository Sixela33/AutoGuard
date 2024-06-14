import 'package:autoguard/presentation/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PerfilScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {

    final usuario = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color(0xFF8BC34A),
        elevation: 0,
      ),
      body: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/profile_picture.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    usuario!.nombre ?? "Sin nombre",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    usuario.email ?? "Sin email",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Fecha de nacimiento: 1 de enero de 1990',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
      );
  }
}

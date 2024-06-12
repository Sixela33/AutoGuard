import 'package:autoguard/core/User/UserRepository.dart';
import 'package:autoguard/presentation/entities/Usuario.dart';
import 'package:autoguard/presentation/screens/MenuMedico.dart';
import 'package:autoguard/presentation/screens/MenuPaciente.dart';
import 'package:flutter/material.dart';


  class MenuScreen extends StatefulWidget {
    @override
    _MenuScreenState createState() => _MenuScreenState();
  }

  class _MenuScreenState extends State<MenuScreen> {

    late Future<Usuario> _future;

    @override
  void initState() {
    _future = getActiveUser();
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Menu Screen',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final user = snapshot.data as Usuario;
                if (user.esMedico ?? false) {
                  return MenuMedico();
                } else {
                  return MenuPaciente();
                }
              }
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      );
    }
  }
  

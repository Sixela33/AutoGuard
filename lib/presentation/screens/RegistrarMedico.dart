/* import 'package:autoguard/presentation/entities/ObraSocial.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final obraSocialProvider = FutureProvider<List<ObraSocial>>((ref) {
  return ref.read(databaseNotifierProvider).getObrasSociales();
});

final obraSocialSeleccionadaProvider = StateProvider<ObraSocial?>((ref) => null);

class RegistroMedicoScreen extends StatelessWidget {
  static String name = "Registrar médico";

  @override
  Widget build(BuildContext context) {
    return const _RegistroMedicoScreen();
  }
}

class _RegistroMedicoScreen extends ConsumerStatefulWidget {
  const _RegistroMedicoScreen({super.key});

  @override
  _RegistroMedicoScreenState createState() => _RegistroMedicoScreenState();
}

class _RegistroMedicoScreenState extends ConsumerState<_RegistroMedicoScreen> {
  final TextEditingController controllerNombre = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerEspecialidad = TextEditingController();
  final TextEditingController numeroObraSocialController = TextEditingController();

  @override
  void dispose() {
    controllerNombre.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerEspecialidad.dispose();
    numeroObraSocialController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Refresh the provider when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(obraSocialProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final obrasSocialesAsync = ref.watch(obraSocialProvider);
    final obraSocialSeleccionada = ref.watch(obraSocialSeleccionadaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Médico'),
      ),
      body: obrasSocialesAsync.when(
        error: (error, stackTrace) {
          return Center(child: Text('Error: $error'));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        data: (obrasSociales) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Registrar Médico',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controllerNombre,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controllerEmail,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controllerPassword,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controllerEspecialidad,
                    decoration: const InputDecoration(
                      labelText: 'Especialidad',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Seleccioná tu obra social:"),
                  DropdownButtonFormField<ObraSocial>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    hint: const Text("Elige tu obra social"),
                    value: obrasSociales.contains(obraSocialSeleccionada) ? obraSocialSeleccionada : null,
                    onChanged: (ObraSocial? newValue) {
                      ref.read(obraSocialSeleccionadaProvider.notifier).state = newValue;
                    },
                    items: obrasSociales.map((ObraSocial value) {
                      return DropdownMenuItem<ObraSocial>(
                        value: value,
                        child: Text(value.nombre),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16.0),
                  const Text("Ingresa tu número de obra social:"),
                  TextField(
                    controller: numeroObraSocialController,
                    decoration: const InputDecoration(
                      hintText: 'Número de obra social',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await ref.read(databaseNotifierProvider).registerWithEmailAndPasswordDoctor(
                          controllerEmail.text,
                          controllerPassword.text,
                          controllerNombre.text,
                          controllerEspecialidad.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('¡Registro de médico exitoso!')),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error en el registro: $e')),
                        );
                      }
                    },
                    child: const Text('Registrar Médico'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
 */
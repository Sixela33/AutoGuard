
import 'package:autoguard/core/IA/IARepository.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConsultarEspecialista extends StatelessWidget {
  const ConsultarEspecialista({super.key});

  @override
  Widget build(BuildContext context) {
    return _ConsultarEspecialista();
  }
}

class _ConsultarEspecialista extends ConsumerWidget {
  _ConsultarEspecialista({
    super.key,
  });

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    //final databaseNotifier = ref.watch(databaseNotifierProvider);
    //databaseNotifier.getEspecialidades();
    return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Consultar Especialista',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                maxLines: 8,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Introduce lo que te pasa',
                ),
              ),
            ),
            TextButton(
              child: const Text('Promptear Modelo'),
              onPressed: ()  {
                final inputUsuario = _controller.text;
                // Aquí pasamos la lista de especialidades disponibles a la función consultarEspecialista
                consultarEspecialista(inputUsuario).then((value) => context.push('/profesionales', extra:value));
              },
            ),
          ],
        ),
      ),
    );
  }
}
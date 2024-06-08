import 'package:autoguard/presentation/entities/DataEntities/TurnoUser.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final misTurnosProvider = FutureProvider<List<TurnoUser>>((ref) {
  return ref.read(databaseNotifierProvider).getTurnosUsuario();
});

class MisTurnosUser extends StatelessWidget {
  const MisTurnosUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MisTurnosUser();
  }
}

class _MisTurnosUser extends ConsumerStatefulWidget {
  const _MisTurnosUser();

  @override
  _MisTurnosUserState createState() => _MisTurnosUserState();
}

class _MisTurnosUserState extends ConsumerState<_MisTurnosUser> {

  @override
  void initState() {
    super.initState();
    // Refresh the provider when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(misTurnosProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final misTurnosAsync = ref.watch(misTurnosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Turnos"),
      ),
      body: misTurnosAsync.when(
        error: (error, stackTrace) {
          return Center(child: Text('Error: $error'));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        data: (turnos) {
          if (turnos.isEmpty) {
            return const Center(child: Text('No hay turnos disponibles.'));
          }

          return ListView.builder(
            itemCount: turnos.length,
            itemBuilder: (context, index) {
              final turno = turnos[index];
              return ListTile(
                title: Text('Médico: ${turno.medicoName}'),
                subtitle: Text('Fecha: ${turno.fechaHora}'),
                trailing: Text(turno.estado.toString().split('.').last),
              );
            },
          );
        }
      ),
    );
  }
}
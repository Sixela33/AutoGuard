import 'package:autoguard/presentation/entities/Firebase.dart';
import 'package:autoguard/presentation/entities/ObraSocial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseNotifierProvider = StateNotifierProvider<DatabaseNotifier, Database>((ref) => DatabaseNotifier());

class DatabaseNotifier extends StateNotifier<Database> {
  DatabaseNotifier() : super(Database());

  Future<void> registerWithEmailAndPassword(String email, String password, List<ObraSocial> obrasSociales) async {
    await state.registerWithEmailAndPassword(email, password, obrasSociales);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await state.signInWithEmailAndPassword(email, password);
  }

  Future<void> addObraSocial(String nombreObraSocial) async {
    await state.addObraSocial(nombreObraSocial);
  }

  void getObrasSociales() async {
    state.getObrasSociales();
  }

  void getEspecialidades() async {
    state.getEspecialidades();
  }
}




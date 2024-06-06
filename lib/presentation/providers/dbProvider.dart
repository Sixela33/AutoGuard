import 'package:autoguard/presentation/entities/DataEntities/EspecialidadMedica.dart';
import 'package:autoguard/presentation/entities/Firebase.dart';
import 'package:autoguard/presentation/entities/DataEntities/Medic.dart';
import 'package:autoguard/presentation/entities/DataEntities/ObraSocial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseNotifierProvider = StateNotifierProvider<DatabaseNotifier, Database>((ref) => DatabaseNotifier());

class DatabaseNotifier extends StateNotifier<Database> {
  DatabaseNotifier() : super(Database());

  Future<void> registerWithEmailAndPassword(String email, String password, List<ObraSocial> obrasSociales) async {
    await state.registerWithEmailAndPassword(email, password, obrasSociales);
  }

  Future<void> registerWithEmailAndPasswordDoctor(String email, String password, String nombre, List<ObraSocial> obrasSociales, List<EspecialidadMedica> especialidades) async {
    await registerWithEmailAndPasswordDoctor(email, password, nombre, obrasSociales, especialidades);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await state.signInWithEmailAndPassword(email, password);
  }

  Future<void> addObraSocial(String nombreObraSocial) async {
    await state.addObraSocial(nombreObraSocial);
  }

  Future<List<ObraSocial>> getObrasSociales() async {
    return state.getObrasSociales();
  }

  Future<List<EspecialidadMedica>> getEspecialidades() async {
    return state.getEspecialidades();
  }

  Future<List<Medic>> getMedicosByEspecialidad(String especialidad) async {
    return state.getMedicosOfEspecialidad(especialidad);
  }
}




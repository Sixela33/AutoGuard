import 'package:autoguard/core/repository/ObraSocialRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObraSocial {
  final String id;
  final String nombre;

  ObraSocial({required this.id, required this.nombre});

  factory ObraSocial.fromMap(Map<String, dynamic> data) => ObraSocial(
    id: data['id'] as String,
    nombre: data['nombre'] as String,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}

final obraSocialProvider = FutureProvider<List<ObraSocial>>((ref) async =>
    ref.read(obraSocialRepositoryProvider).getObrasSociales());
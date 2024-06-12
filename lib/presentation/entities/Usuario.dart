import 'package:autoguard/presentation/entities/DataEntities/EspecialidadMedica.dart';
import 'package:autoguard/presentation/entities/DataEntities/ObraSocial.dart';

class Usuario {
  final String? email;
  final List<EspecialidadMedica>? especialidades;
  final String? nombre;
  final String? id;
  final bool? esMedico;
  final List<ObraSocial>? obrasSociales;

  Usuario(
      {this.email,
      this.especialidades,
      this.nombre,
      this.id,
      this.esMedico,
      this.obrasSociales});

  Usuario copyWith({
    String? email,
    List<EspecialidadMedica>? especialidades,
    String? nombre,
    String? id,
    bool? esMedico,
    List<ObraSocial>? obrasSociales,
  }) {
    return Usuario(
      email: email ?? this.email,
      especialidades: especialidades ?? this.especialidades,
      nombre: nombre ?? this.nombre,
      id: id ?? this.id,
      esMedico: esMedico ?? this.esMedico,
      obrasSociales: obrasSociales ?? this.obrasSociales,
    );
  }

  factory Usuario.fromMap(Map<String, dynamic> data) => Usuario(
        email: data['email'] as String,
        especialidades: (data['especialidades'] as List<dynamic>?)
            ?.cast<EspecialidadMedica>(),
        nombre: data['nombre'] as String?,
        id: data['id'] as String,
        esMedico: data['es_medico'] as bool,
        obrasSociales:
            (data['obras_sociales'] as List<dynamic>?)?.cast<ObraSocial>(),
      );
}

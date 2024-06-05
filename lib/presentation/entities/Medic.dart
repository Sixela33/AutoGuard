class Medic {
  final String id;
  final String nombre;
  final String email;
  final List<String> especialidades;
  final List<String> obras_sociales;
  final bool es_medico;

  Medic({
    required this.email,
    required this.especialidades,
    required this.obras_sociales,
    required this.es_medico,
    required this.id,
    required this.nombre
  });

  factory Medic.fromMap(Map<String, dynamic> data) {
    return Medic(
      email: data['email'] as String,
      id: data['id'] as String,
      nombre: data['nombre'] as String,
      especialidades: List<String>.from(data['especialidades'] as List<dynamic>),
      obras_sociales: List<String>.from(data['obras_sociales'] as List<dynamic>),
      es_medico: data['es_medico'] as bool,
    );
  }
}

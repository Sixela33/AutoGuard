class Usuario {
  final String email;
  final String? especialidad;
  final String nombre;
  final String apellido;
  final String id;
  final bool esMedico;

  Usuario({required this.email, this.especialidad, required this.nombre, required this.apellido, required this.id, required this.esMedico});

  factory Usuario.fromMap(Map<String, dynamic> data) => Usuario(
    email: data['email'] as String,
    especialidad: data['especialidad'] as String,
    nombre: data['nombre'] as String,
    apellido: data['apellido'] as String,
    id: data['id'] as String,
    esMedico: data['esMedico'] as bool,
  );
}
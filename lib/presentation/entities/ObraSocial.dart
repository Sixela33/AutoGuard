class ObraSocial {
  final String id;
  final String nombre;

  ObraSocial({required this.id, required this.nombre});

  factory ObraSocial.fromMap(Map<String, dynamic> data) => ObraSocial(
    id: data['id'] as String,
    nombre: data['nombre'] as String,
  );
}
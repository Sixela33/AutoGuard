import 'package:autoguard/presentation/entities/Usuario.dart';

abstract interface class UserDAO {
  Future<Usuario> getActiveUser();
  Future<List<Usuario>> getMedicosEspecialidad(String especialidad);
  Future<List<String?>> getEspecialidades();
}
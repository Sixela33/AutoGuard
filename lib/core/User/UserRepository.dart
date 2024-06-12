
import 'package:autoguard/core/User/UserDAO.dart';
import 'package:autoguard/core/User/UserDAOFirebase.dart';
import 'package:autoguard/presentation/entities/Usuario.dart';

final UserDAO userDAO = UserDaoFirebase();

Future<Usuario> getActiveUser() async {
  return userDAO.getActiveUser();
}

Future<List<Usuario>> getMedicosEspecialidad(String especialidad) async {
  return userDAO.getMedicosEspecialidad(especialidad);
}

Future<List<String?>> getEspecialidades() async {
  return userDAO.getEspecialidades();
}


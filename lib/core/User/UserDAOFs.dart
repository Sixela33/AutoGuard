import 'package:autoguard/core/User/UserDAO.dart';
import 'package:autoguard/core/User/users.dart';
import 'package:autoguard/presentation/entities/Usuario.dart';

class UserDAOFs implements UserDAO {

  UserDAOFs();


  @override
  Future<Usuario> getActiveUser() {
    return Future.value(users[0]);
  }

  @override
  Future<List<Usuario>> getMedicosEspecialidad(String especialidad) {
    return Future.value(users.where((element) => element.especialidad == especialidad).toList());
  }

  @override
  Future<List<String?>> getEspecialidades() {
    return Future.value(users.map((e) => e.especialidad).toSet().toList());
  }
  
}
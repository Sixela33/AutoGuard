import 'package:autoguard/core/User/UserDAO.dart';
import 'package:autoguard/core/User/users.dart';
import 'package:autoguard/presentation/entities/Usuario.dart';

class UserDAOFs implements UserDAO {

  UserDAOFs();


  @override
  Future<Usuario> getActiveUser() {
    return Future.value(users[1]);
  }

  @override
  Future<List<Usuario>> getMedicosEspecialidad(String especialidad) {
    throw UnimplementedError();
  }

  @override
  Future<List<String?>> getEspecialidades() {
    throw UnimplementedError();
  }
  
}
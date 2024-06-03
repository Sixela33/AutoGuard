import 'package:autoguard/core/IA/IAProxy.dart';

class IAProxyMock implements IAProxy {

  IAProxyMock();

  @override
  Future<String> consultarEspecialista(String inputUsuario) {
    return Future.value("Cardiólogo");
  }

}
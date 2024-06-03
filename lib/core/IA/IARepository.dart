import 'package:autoguard/core/IA/IAProxy.dart';
import 'package:autoguard/core/IA/IAProxyMock.dart';

final IAProxy iAProxy = IAProxyMock();

Future<String> consultarEspecialista(String inputUsuario) async {
  return iAProxy.consultarEspecialista(inputUsuario);
}
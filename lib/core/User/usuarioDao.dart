import 'package:autoguard/presentation/entities/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<Usuario> getUsuario() async {

  return _firestore.collection('users').limit(1).get().then((value) => Usuario.fromMap(value.docs.first.data()));
}
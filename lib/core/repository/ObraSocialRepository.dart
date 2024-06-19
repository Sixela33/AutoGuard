import 'package:autoguard/presentation/entities/DataEntities/ObraSocial.dart';
import 'package:autoguard/presentation/entities/Firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObrasocialRepository {

  FirebaseFirestore _firestore;

  ObrasocialRepository(this._firestore);


  Future<List<ObraSocial>> getObrasSociales() async {
    return  _firestore.collection('obraSocial').withConverter(fromFirestore: (snapshot, _) => ObraSocial.fromMap(snapshot.data()!), toFirestore: (obraSocial, _) => obraSocial.toMap()).get().then((value) => value.docs.map((e) => e.data()).toList());
}
}

final obraSocialRepositoryProvider = Provider((ref) => ObrasocialRepository(ref.read(firebaseFirestoreProvider)));
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudclientes/clients/models/client.dart';

class ClientRepositoryAPI {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> create(Client client) {
    try {
      DocumentReference newClient = _firestore.collection('clients').doc();
      return newClient.set({
        'name': client.name,
        'dateOfBirth': client.dateOfBirth,
        'statusCivil': statusCivilToString(client.statusCivil),
        'active': client.active,
        'uid': newClient.id
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateStatus(String clientId, bool status) {
    try {
      return _firestore
          .collection('clients')
          .doc(clientId)
          .update({'active': status});
    } catch (e) {
      throw e;
    }
  }

  Future<void> update(Client client) {
    try {
      return _firestore.collection('clients').doc(client.uid).update({
        'name': client.name,
        'dateOfBirth': client.dateOfBirth,
        'statusCivil': statusCivilToString(client.statusCivil),
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> delete(String clientId) {
    try {
      return _firestore.collection('clients').doc(clientId).delete();
    } catch (e) {
      throw e;
    }
  }

  Stream<List<Client>> getClients() {
    try {
      return _firestore.collection('clients').snapshots().map(
          (QuerySnapshot querySnapshot) =>
              querySnapshot.docs.map((DocumentSnapshot documentSnapshot) {
                return Client.fromJson(documentSnapshot.data());
              }).toList());
    } catch (e) {
      throw e;
    }
  }
}

import 'package:crudclientes/clients/models/client.dart';
import 'package:crudclientes/clients/repository/client_repository_api.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rxdart/subjects.dart';

class ClientBloc {
  final _clientRepositoryAPI = ClientRepositoryAPI();
  final FormGroup clientForm = FormGroup({
    'active': FormControl<bool>(value: false),
    'name': FormControl<String>(validators: [Validators.required]),
    'statusCivil': FormControl<String>(value: 'single'),
    'uid': FormControl<String>()
  });

  void clearForm() {
    this.clientForm.control('active').value = false;
    this.clientForm.control('name').value = '';
    this.clientForm.control('statusCivil').value = 'single';
  }

  void loadData(Client client) {
    this.clientForm.control('name').value = client.name;
    this.clientForm.control('statusCivil').value =
        statusCivilToString(client.statusCivil);
    this.clientForm.control('uid').value = client.uid;
    setDateOfBirth(client.dateOfBirth);
  }

  final _dateOfBirthSubject = BehaviorSubject<DateTime>();
  Stream<DateTime> get dateOfBirth$ => _dateOfBirthSubject.stream;
  DateTime get getDateOfBirth => _dateOfBirthSubject.value;
  void setDateOfBirth(DateTime dateOfBirth) =>
      _dateOfBirthSubject.add(dateOfBirth);

  final _clientCurrentSubject = BehaviorSubject<Client>();
  Stream<Client> get clientCurrent => _clientCurrentSubject.stream;
  Client get getCurrentClient => _clientCurrentSubject.value;
  void setCurrentClient(Client client) => _clientCurrentSubject.add(client);

  Future<void> create(Client client) {
    return _clientRepositoryAPI.create(client);
  }

  Future<void> updateStatus(String clientId, bool status) {
    return _clientRepositoryAPI.updateStatus(clientId, status);
  }

  Future<void> update(Client client) {
    return _clientRepositoryAPI.update(client);
  }

  Future<void> delete(String clientId) {
    return _clientRepositoryAPI.delete(clientId);
  }

  Stream<List<Client>> getClients() {
    return _clientRepositoryAPI.getClients();
  }

  String dateFormat(DateTime date) {
    return DateFormat.yMMMMd('es').format(date);
  }

  void dispose() {
    _dateOfBirthSubject?.close();
  }
}

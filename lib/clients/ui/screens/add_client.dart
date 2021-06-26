import 'package:crudclientes/clients/bloc/client_bloc.dart';
import 'package:crudclientes/clients/models/client.dart';
import 'package:crudclientes/clients/ui/widgets/date_of_birth.dart';
import 'package:crudclientes/clients/ui/widgets/name_client.dart';
import 'package:crudclientes/clients/ui/widgets/status_civil_radio.dart';
import 'package:crudclientes/clients/ui/widgets/status_of_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddClient extends StatefulWidget {
  AddClient({Key key}) : super(key: key);

  @override
  _AddClientState createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  ClientBloc bloc;
  @override
  void initState() {
    bloc = Provider.of<ClientBloc>(context, listen: false);
    bloc.clearForm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cliente'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: ReactiveForm(
            formGroup: bloc.clientForm,
            child: Column(
              children: [
                NameClient(),
                SizedBox(height: 15),
                DateOfBirth(
                  bloc: bloc,
                ),
                SizedBox(
                  height: 15,
                ),
                StatusCivilRadio(bloc: bloc),
                SizedBox(
                  height: 15,
                ),
                StatusOfClient(bloc: bloc),
                SizedBox(
                  height: 25,
                ),
                _addClient(bloc)
              ],
            )),
      ),
    );
  }

  Widget _addClient(ClientBloc bloc) {
    return ElevatedButton(
      onPressed: () {
        Client client = Client(
            active: bloc.clientForm.control('active').value,
            name: bloc.clientForm.control('name').value,
            statusCivil: statusCivilFromString(
                bloc.clientForm.control('statusCivil').value),
            dateOfBirth: bloc.getDateOfBirth);

        bloc.create(client);
        Navigator.pop(context);
        bloc.clearForm();
      },
      child: Text('Crear Cliente'),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size.fromWidth(200)),
          textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    );
  }
}

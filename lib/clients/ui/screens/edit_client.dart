import 'package:crudclientes/clients/bloc/client_bloc.dart';
import 'package:crudclientes/clients/models/client.dart';
import 'package:crudclientes/clients/ui/widgets/date_of_birth.dart';
import 'package:crudclientes/clients/ui/widgets/name_client.dart';
import 'package:crudclientes/clients/ui/widgets/status_civil_radio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditClient extends StatefulWidget {
  const EditClient({Key key}) : super(key: key);

  @override
  _EditClientState createState() => _EditClientState();
}

class _EditClientState extends State<EditClient> {
  ClientBloc bloc;
  @override
  void initState() {
    bloc = Provider.of<ClientBloc>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc.loadData(bloc.getCurrentClient);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Cliente'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: ReactiveForm(
            formGroup: bloc.clientForm,
            child: Column(
              children: [
                _showClientId(bloc.getCurrentClient.uid),
                SizedBox(height: 15),
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
                _editClient(bloc)
              ],
            )),
      ),
    );
  }

  Widget _showClientId(String clientId) {
    return Row(
      children: [
        Icon(
          Icons.vpn_key,
          color: Colors.blue,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'Id: ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          clientId,
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }

  Widget _editClient(ClientBloc bloc) {
    return ElevatedButton(
      onPressed: () {
        Client client = Client(
            name: bloc.clientForm.control('name').value,
            statusCivil: statusCivilFromString(
                bloc.clientForm.control('statusCivil').value),
            dateOfBirth: bloc.getDateOfBirth,
            uid: bloc.clientForm.control('uid').value);

        bloc.update(client);
        Navigator.pop(context);
        bloc.clearForm();
      },
      child: Text('Actualizar Cliente'),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size.fromWidth(200)),
          textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    );
  }
}

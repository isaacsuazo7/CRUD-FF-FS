import 'package:crudclientes/clients/bloc/client_bloc.dart';
import 'package:crudclientes/clients/models/client.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  final Client client;
  final ClientBloc bloc;
  const EditButton({Key key, @required this.client, @required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/edit');
        bloc.setCurrentClient(client);
      },
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10)),
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit,
              color: Colors.blue,
              size: 15,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Editar',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ));
  }
}

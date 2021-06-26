import 'package:crudclientes/clients/bloc/client_bloc.dart';
import 'package:crudclientes/clients/models/client.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final Client client;
  final ClientBloc bloc;
  const DeleteButton({Key key, @required this.client, @required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        bloc.delete(client.uid);
      },
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10)),
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete,
              color: Colors.red,
              size: 15,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Eliminar',
              style: TextStyle(
                  color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ));
  }
}

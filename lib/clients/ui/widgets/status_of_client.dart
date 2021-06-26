import 'package:crudclientes/clients/bloc/client_bloc.dart';
import 'package:flutter/material.dart';

class StatusOfClient extends StatefulWidget {
  final ClientBloc bloc;
  const StatusOfClient({Key key, @required this.bloc}) : super(key: key);

  @override
  _StatusOfClientState createState() => _StatusOfClientState();
}

class _StatusOfClientState extends State<StatusOfClient> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.people,
          color: Colors.blue,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'Estado: ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Switch(
            value: widget.bloc.clientForm.control('active').value,
            onChanged: (value) {
              setState(() {
                widget.bloc.clientForm.control('active').value = value;
              });
            })
      ],
    );
  }
}

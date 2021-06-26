import 'dart:math';

import 'package:crudclientes/clients/bloc/client_bloc.dart';
import 'package:crudclientes/clients/models/client.dart';
import 'package:crudclientes/clients/ui/widgets/delete_button.dart';
import 'package:crudclientes/clients/ui/widgets/edit_button.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatefulWidget {
  final Client client;
  final ClientBloc bloc;
  ClientCard({Key key, @required this.client, @required this.bloc})
      : super(key: key);

  @override
  _ClientCardState createState() => _ClientCardState();
}

class _ClientCardState extends State<ClientCard> {
  bool status;

  @override
  void initState() {
    status = widget.client.active;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
          child: Text(widget.client.name[0].toUpperCase()),
        ),
        title: Text(
          widget.client.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${widget.client.uid}'),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                EditButton(
                  client: widget.client,
                  bloc: widget.bloc,
                ),
                SizedBox(
                  width: 5,
                ),
                DeleteButton(
                  client: widget.client,
                  bloc: widget.bloc,
                )
              ],
            )
          ],
        ),
        trailing: Switch(
          value: status,
          onChanged: (value) {
            setState(() {
              status = value;
              widget.bloc.updateStatus(widget.client.uid, status);
            });
          },
        ),
      ),
    );
  }
}

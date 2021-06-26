import 'package:crudclientes/clients/bloc/client_bloc.dart';
import 'package:crudclientes/clients/models/client.dart';
import 'package:flutter/material.dart';

class StatusCivilRadio extends StatefulWidget {
  final ClientBloc bloc;
  StatusCivilRadio({Key key, @required this.bloc}) : super(key: key);

  @override
  _StatusCivilRadioState createState() => _StatusCivilRadioState();
}

class _StatusCivilRadioState extends State<StatusCivilRadio> {
  StatusCivil statusCivil;
  @override
  void initState() {
    statusCivil = statusCivilFromString(
        widget.bloc.clientForm.control('statusCivil').value);

    super.initState();
  }

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
        Text('Estado Civil:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            children: [
              RadioListTile(
                title: Text(statusCivilTitleSpanish[StatusCivil.single]),
                value: StatusCivil.single,
                groupValue: statusCivil,
                onChanged: (StatusCivil value) {
                  setState(() {
                    statusCivil = value;
                    widget.bloc.clientForm.control('statusCivil').value =
                        statusCivilToString(statusCivil);
                  });
                },
              ),
              RadioListTile(
                title: Text(statusCivilTitleSpanish[StatusCivil.married]),
                value: StatusCivil.married,
                groupValue: statusCivil,
                onChanged: (StatusCivil value) {
                  setState(() {
                    statusCivil = value;
                    widget.bloc.clientForm.control('statusCivil').value =
                        statusCivilToString(statusCivil);
                  });
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

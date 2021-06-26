import 'package:crudclientes/clients/bloc/client_bloc.dart';
import 'package:crudclientes/clients/models/client.dart';
import 'package:flutter/material.dart';

class DateOfBirth extends StatefulWidget {
  final ClientBloc bloc;
  DateOfBirth({Key key, @required this.bloc}) : super(key: key);

  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  Client client;
  static const FIRST_DAY_TO_CHOOSE = -40000;

  @override
  void initState() {
    client = widget.bloc.getCurrentClient;
    if (client == null) widget.bloc.setDateOfBirth(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          color: Colors.blue,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'Fecha de nacimiento: ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              _pickedDateOfBirth(widget.bloc);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(25)),
              child: StreamBuilder(
                  stream: widget.bloc.dateOfBirth$,
                  builder: (context, snapshot) {
                    return Text(
                        widget.bloc.dateFormat(widget.bloc.getDateOfBirth));
                  }),
            ),
          ),
        )
      ],
    );
  }

  void _pickedDateOfBirth(ClientBloc bloc) async {
    DateTime date;
    date = await showDatePicker(
      locale: Locale("es", "HN"),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().add(Duration(days: FIRST_DAY_TO_CHOOSE)),
      lastDate: DateTime.now(),
    );
    (date != null) ? bloc.setDateOfBirth(date) : DateTime.now();
  }
}

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class NameClient extends StatelessWidget {
  const NameClient({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.person_add,
          color: Colors.blue,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'Nombre: ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ReactiveTextField(
            formControlName: 'name',
            validationMessages: (control) =>
                {'required': 'El dato es requerido'},
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}

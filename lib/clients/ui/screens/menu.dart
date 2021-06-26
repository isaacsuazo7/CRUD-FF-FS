import 'package:crudclientes/clients/bloc/client_bloc.dart';
import 'package:crudclientes/clients/models/client.dart';
import 'package:crudclientes/clients/ui/widgets/client_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ClientBloc bloc;

  @override
  void initState() {
    bloc = Provider.of<ClientBloc>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _addClient(),
              SizedBox(
                height: 15,
              ),
              _loadClients()
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadClients() {
    return StreamBuilder(
      stream: bloc.getClients(),
      builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
        if (snapshot.hasData) {
          List<Client> clients = snapshot.data;
          return ListView.builder(
            itemCount: clients.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              Client client = clients[index];
              return ClientCard(
                client: client,
                bloc: bloc,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _addClient() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            child: Row(
              children: [
                Icon(Icons.add_circle),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Añadir Clientes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ],
    );
  }
}

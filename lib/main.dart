import 'package:crudclientes/clients/bloc/client_bloc.dart';
import 'package:crudclientes/clients/ui/screens/add_client.dart';
import 'package:crudclientes/clients/ui/screens/edit_client.dart';
import 'package:crudclientes/clients/ui/screens/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ClientBloc>(
      create: (BuildContext context) => ClientBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<ClientBloc>(
        builder: (context, value, child) => MaterialApp(
          title: 'CRUD-CLIENTS',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [Locale("es", "HN")],
          home: Menu(),
          routes: {
            '/add': (context) => AddClient(),
            '/edit': (context) => EditClient()
          },
        ),
      ),
    );
  }
}

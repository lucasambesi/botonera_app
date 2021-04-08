import 'package:botonera_app/Pages/HomePage/PantallaPrincipal.dart';
import 'package:botonera_app/db/DAOs/ParametroDAO.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ParametroDAO.getParametros(),
      builder: builderChangeNotifierProvider,
    );
  }

  Widget builderChangeNotifierProvider(
      BuildContext context, AsyncSnapshot<List<Parametro>> snapshot) {
    if (snapshot.hasError) {
      return Center(
        child: Text('ERROR: ${snapshot.error.toString()}'),
      );
    }
    if (!snapshot.hasData) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ChangeNotifierProvider<ParametrosProvider>(
      create: (_) => ParametrosProvider(
        parametros: snapshot.data,
      ),
      child: MaterialApp(
        title: 'Botonera.App',
        home: PantallaPrincipal(),
      ),
    );
  }
}

import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:botonera_app/Pages/SoundsPage/CategoriasPage/FBCategoriasCards.dart';
import 'package:provider/provider.dart';

class PantallaCategorias extends StatefulWidget {
  State<StatefulWidget> createState() => _PantallaCategoriasState();
}

class _PantallaCategoriasState extends State<PantallaCategorias> {
  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor:
            Helpers.getColorByParam(paramsProvider.colorFondoSonidos),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Categorias',
            style: TextStyle(
              color: Helpers.getColorConstrastByParam(
                  paramsProvider.colorBarraSuperior),
            ),
          ),
          backgroundColor:
              Helpers.getColorByParam(paramsProvider.colorBarraSuperior),
          shadowColor: Colors.white,
        ),
        body: Padding(
          child: FBCategoriaCards(),
          padding: EdgeInsets.only(top: 8.0),
        ),
      ),
    );
  }
}

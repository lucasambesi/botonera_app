import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:botonera_app/Pages/SoundsPage/CategoriasPage/FBCategoriasCards.dart';

class PantallaCategorias extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaCategoriasImpl();
}

class PantallaCategoriasImpl extends State<PantallaCategorias> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Categorias'),
          backgroundColor: Colors.yellow[300],
          shadowColor: Colors.white,
        ),
        body: FBCategoriaCards(),
      ),
    );
  }
}

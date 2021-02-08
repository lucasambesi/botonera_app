import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:botonera_app/Pages/SoundsPage/FBCards.dart';
import 'package:botonera_app/db/AudioDAO.dart';
import 'package:botonera_app/models/Categoria.dart';

class CategoriaAudiosPage extends StatefulWidget {
  final Categoria categoria;
  CategoriaAudiosPage({@required this.categoria});

  State<StatefulWidget> createState() =>
      CategoriaAudiosPageImpl(categoria: categoria);
}

class CategoriaAudiosPageImpl extends State<CategoriaAudiosPage> {
  final Categoria categoria;

  CategoriaAudiosPageImpl({@required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoria.nombre,
        ),
        backgroundColor: Colors.yellow[300],
        shadowColor: Colors.white,
      ),
      body: FutureBuilderCards(
        callback: AudioDAO.getAudiosByCategoria,
        categoria: categoria,
      ),
    );
  }
}

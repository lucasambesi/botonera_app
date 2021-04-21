import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:botonera_app/Pages/SoundsPage/AudioCard/FBAudiosCards.dart';
import 'package:botonera_app/db/DAOs/AudioDAO.dart';
import 'package:botonera_app/models/Categoria.dart';
import 'package:provider/provider.dart';

class CategoriaAudiosPage extends StatefulWidget {
  final Categoria categoria;
  CategoriaAudiosPage({@required this.categoria});

  State<StatefulWidget> createState() =>
      _CategoriaAudiosPageState(categoria: categoria);
}

class _CategoriaAudiosPageState extends State<CategoriaAudiosPage> {
  final Categoria categoria;

  _CategoriaAudiosPageState({@required this.categoria});

  @override
  Widget build(BuildContext context) {
    var paramsProvider = Provider.of<ParametrosProvider>(
      context,
      listen: false,
    );
    Color colorFondo =
        Helpers.getColorByParam(paramsProvider.colorBarraSuperior);
    Color colorFondoContraste =
        Helpers.getColorConstrastByParam(paramsProvider.colorBarraSuperior);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorFondoContraste),
        title: Text(
          categoria.nombre,
          style: TextStyle(
            color: colorFondoContraste,
          ),
        ),
        backgroundColor: colorFondo,
        shadowColor: colorFondo,
      ),
      body: FutureBuilderCards(
        callback: AudioDAO.getAudiosByCategoria,
        categoria: categoria,
        desordenar: true,
      ),
    );
  }
}

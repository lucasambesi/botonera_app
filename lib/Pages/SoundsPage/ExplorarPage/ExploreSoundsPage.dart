import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/SoundsPage/AudioCard/FBAudiosCards.dart';
import 'package:botonera_app/db/DAOs/AudioDAO.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PantallaExplorarSonidos extends StatefulWidget {
  State<StatefulWidget> createState() => _PantallaExplorarState();
}

class _PantallaExplorarState extends State<PantallaExplorarSonidos> {
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
            'Explorar',
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
          child: FutureBuilderCards(
            callback: AudioDAO.getAudios,
            desordenar: true,
          ),
          padding: EdgeInsets.only(top: 8.0),
        ),
      ),
    );
  }
}

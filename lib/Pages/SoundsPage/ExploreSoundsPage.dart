import 'package:botonera_app/Pages/SoundsPage/FutureBuilderCards.dart';
import 'package:botonera_app/db/AudioDAO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaExplorarSonidos extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaExplorarImpl();
}

class PantallaExplorarImpl extends State<PantallaExplorarSonidos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilderCards(
          callback: AudioDAO.getAudios,
        ),
      ),
    );
  }
}

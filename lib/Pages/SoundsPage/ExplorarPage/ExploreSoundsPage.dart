import 'package:botonera_app/Pages/SoundsPage/FBCards.dart';
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
        appBar: AppBar(
          title: Text('Explorar'),
          backgroundColor: Colors.yellow[300],
          shadowColor: Colors.white,
        ),
        body: Padding(
          child: FutureBuilderCards(
            callback: AudioDAO.getAudios,
          ),
          padding: EdgeInsets.only(top: 8.0),
        ),
      ),
    );
  }
}

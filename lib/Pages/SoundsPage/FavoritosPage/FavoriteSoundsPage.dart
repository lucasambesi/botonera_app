import 'package:botonera_app/Pages/SoundsPage/FBCards.dart';
import 'package:botonera_app/db/AudioDAO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaFavoritos extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaFavoritosImpl();
}

class PantallaFavoritosImpl extends State<PantallaFavoritos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Favoritos'),
          backgroundColor: Colors.yellow[300],
          shadowColor: Colors.white,
        ),
        body: Padding(
          child: FutureBuilderCards(
            callback: AudioDAO.getAudiosFavoritos,
          ),
          padding: EdgeInsets.only(top: 8.0),
        ),
      ),
    );
  }
}

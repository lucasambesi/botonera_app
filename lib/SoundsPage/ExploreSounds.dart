import 'package:botonera_app/SoundsPage/ButtomCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaExplorar extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaExplorarImpl();
}

class PantallaExplorarImpl extends State<PantallaExplorar> {
  @override
  List<Widget> _cards = [
    BotonCard(audio: 'amo sus errores'),
    BotonCard(audio: 'aver aver que paso'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      crossAxisCount: (2),
      children: _cards,
    ));
  }
}

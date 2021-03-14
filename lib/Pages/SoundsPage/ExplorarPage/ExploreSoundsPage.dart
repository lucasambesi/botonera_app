import 'package:botonera_app/Pages/SoundsPage/FBCards.dart';
import 'package:botonera_app/db/AudioDAO.dart';
import 'package:botonera_app/db/ParametroDAO.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PantallaExplorarSonidos extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaExplorarImpl();
}

class PantallaExplorarImpl extends State<PantallaExplorarSonidos> {
  Color colorFondoSonidos;
  Color colorbarraSuperior;

  @override
  void initState() {
    super.initState();
    setcolorFondoSonidos();
    setcolorBarraSuperior();
  }

  Future<void> setcolorFondoSonidos() async {
    ParametroDAO.getParametro("colorFondoSonidos").then((content) {
      setState(() {
        colorFondoSonidos = ColorParser.hex(content.valor).getColor();
      });
    });
  }

  Future<void> setcolorBarraSuperior() async {
    ParametroDAO.getParametro("colorBarraSuperior").then((content) {
      setState(() {
        colorbarraSuperior = ColorParser.hex(content.valor).getColor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor: colorFondoSonidos,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Explorar',
            style: TextStyle(
              color: useWhiteForeground(colorbarraSuperior)
                  ? const Color(0xffffffff)
                  : const Color(0xff000000),
            ),
          ),
          backgroundColor: colorbarraSuperior,
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

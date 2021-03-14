import 'package:botonera_app/db/ParametroDAO.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:botonera_app/Pages/SoundsPage/CategoriasPage/FBCategoriasCards.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PantallaCategorias extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaCategoriasImpl();
}

class PantallaCategoriasImpl extends State<PantallaCategorias> {
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
            'Categorias',
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
          child: FBCategoriaCards(),
          padding: EdgeInsets.only(top: 8.0),
        ),
      ),
    );
  }
}

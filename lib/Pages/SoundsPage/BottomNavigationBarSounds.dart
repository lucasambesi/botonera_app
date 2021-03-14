import 'package:botonera_app/Pages/SoundsPage/CategoriasPage/CategoriesSoundsPage.dart';
import 'package:botonera_app/Pages/SoundsPage/ExplorarPage/ExploreSoundsPage.dart';
import 'package:botonera_app/Pages/SoundsPage/FavoritosPage/FavoriteSoundsPage.dart';
import 'package:botonera_app/db/ParametroDAO.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class BarraNavegacion extends StatefulWidget {
  State<StatefulWidget> createState() => BarraNavegacionImpl();
}

class BarraNavegacionImpl extends State<BarraNavegacion> {
  int _currentIndex = 1;
  Color colorbarraInferior;

  final List<Widget> _children = [
    PantallaExplorarSonidos(),
    PantallaCategorias(),
    PantallaFavoritos(),
  ];

  @override
  void initState() {
    super.initState();

    setcolorBarraSuperior();
  }

  Future<void> setcolorBarraSuperior() async {
    ParametroDAO.getParametro("colorBarraInferior").then((content) {
      setState(() {
        colorbarraInferior = ColorParser.hex(content.valor).getColor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: barraNavegacionInferior(),
    );
  }

  BottomNavigationBar barraNavegacionInferior() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      iconSize: 24,
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorbarraInferior,
      fixedColor: useWhiteForeground(colorbarraInferior)
          ? const Color(0xffffffff)
          : const Color(0xff000000),
      unselectedItemColor: useWhiteForeground(colorbarraInferior)
          ? const Color(0xffe0e0e0)
          : const Color(0xff616161),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Explorar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categorias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: BackButtonIcon(),
          label: 'Volver',
        ),
      ],
    );
  }

  void onTabTapped(int index) {
    if (index == 3) {
      Navigator.of(context).pop();
    } else {
      setState(
        () {
          _currentIndex = index;
        },
      );
    }
  }
}

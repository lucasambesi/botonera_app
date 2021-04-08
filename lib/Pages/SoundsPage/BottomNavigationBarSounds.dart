import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/SoundsPage/CategoriasPage/CategoriesSoundsPage.dart';
import 'package:botonera_app/Pages/SoundsPage/ExplorarPage/ExploreSoundsPage.dart';
import 'package:botonera_app/Pages/SoundsPage/FavoritosPage/FavoriteSoundsPage.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class BarraNavegacion extends StatefulWidget {
  State<StatefulWidget> createState() => _BarraNavegacionState();
}

class _BarraNavegacionState extends State<BarraNavegacion> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    PantallaExplorarSonidos(),
    PantallaCategorias(),
    PantallaFavoritos(),
  ];

  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return Scaffold(
      body: Center(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: barraNavegacionInferior(paramsProvider),
    );
  }

  BottomNavigationBar barraNavegacionInferior(
      ParametrosProvider paramsProvider) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      iconSize: 24,
      type: BottomNavigationBarType.fixed,
      backgroundColor:
          Helpers.getColorByParam(paramsProvider.colorBarraInferior),
      fixedColor:
          Helpers.getColorConstrastByParam(paramsProvider.colorBarraInferior),
      unselectedItemColor: useWhiteForeground(
              Helpers.getColorByParam(paramsProvider.colorBarraInferior))
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

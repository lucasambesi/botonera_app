import 'package:botonera_app/Pages/SoundsPage/CategoriasPage/CategoriesSoundsPage.dart';
import 'package:botonera_app/Pages/SoundsPage/ExplorarPage/ExploreSoundsPage.dart';
import 'package:botonera_app/Pages/SoundsPage/FavoritosPage/FavoriteSoundsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarraNavegacion extends StatefulWidget {
  State<StatefulWidget> createState() => BarraNavegacionImpl();
}

class BarraNavegacionImpl extends State<BarraNavegacion> {
  int _currentIndex = 2;

  final List<Widget> _children = [
    PantallaExplorarSonidos(),
    PantallaCategorias(),
    PantallaFavoritos(),
  ];

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
      backgroundColor: Colors.yellow[300],
      fixedColor: Colors.black,
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
          icon: Icon(Icons.favorite),
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

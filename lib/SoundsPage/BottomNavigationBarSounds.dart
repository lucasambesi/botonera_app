import 'package:botonera_app/SoundsPage/ExploreSounds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarraNavegacion extends StatefulWidget {
  State<StatefulWidget> createState() => BarraNavegacionImpl();
}

class BarraNavegacionImpl extends State<BarraNavegacion> {
  int _currentIndex = 2;

  final List<Widget> _children = [
    PantallaExplorarSonidos(),
    Container(
      child: Card(
        child: Text('Categorias'),
        color: Colors.green,
      ),
    ),
    Container(
      child: Card(
        child: Text('Tus listas'),
        color: Colors.blue,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BarraNavegacionInferior(),
    );
  }

  BottomNavigationBar BarraNavegacionInferior() {
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
          icon: Icon(Icons.list),
          label: 'Tus listas',
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

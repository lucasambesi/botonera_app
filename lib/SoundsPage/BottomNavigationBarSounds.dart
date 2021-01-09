import 'package:botonera_app/SoundsPage/ExporeSounds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  State<StatefulWidget> createState() => NavigationBarImpl();
}

class NavigationBarImpl extends State<NavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    PantallaExplorar(),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow[300],
        fixedColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Explorar')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categorias')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Tus listas')),
          BottomNavigationBarItem(
              icon: BackButtonIcon(), title: Text('Volver')),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    if (index == 3) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}

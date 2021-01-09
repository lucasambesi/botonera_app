import 'dart:io' show Platform, exit;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:botonera_app/SoundsPage/BottomNavigationBarSounds.dart';
import 'package:botonera_app/SettingPage/SettingPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageImpl createState() => HomePageImpl();
}

class HomePageImpl extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Botonera.App', home: BaseLayout());
  }
}

class BaseLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_FondoBlanco.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Center(
              child: Image.asset('assets/images/logo_home.jpg',
                  width: MediaQuery.of(context).size.width * 1),
            ),
            flex: 4,
          ),
          Flexible(
              flex: 1,
              child: ButtonTheme(
                minWidth: 200,
                height: 35,
                child: RaisedButton(
                  child: Text('Sonidos'),
                  color: Colors.yellow,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NavigationBar(),
                      ),
                    );
                  },
                ),
              )),
          SizedBox(height: 30),
          Flexible(
            flex: 1,
            child: ButtonTheme(
              minWidth: 200,
              height: 35,
              child: RaisedButton(
                child: Text('Configuración'),
                color: Colors.yellow,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PantallaConfiguracion(),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 30),
          Flexible(
            flex: 1,
            child: ButtonTheme(
              minWidth: 200,
              height: 35,
              child: RaisedButton(
                child: Text('Salir'),
                color: Colors.yellow,
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

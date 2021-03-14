import 'dart:io' show Platform, exit;
import 'package:botonera_app/db/ParametroDAO.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:botonera_app/Pages/SoundsPage/BottomNavigationBarSounds.dart';
import 'package:botonera_app/Pages/SenttingsPage/SenttingsPage.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageImpl createState() => HomePageImpl();
}

class HomePageImpl extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botonera.App',
      home: PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatefulWidget {
  PantallaPrincipal({Key key}) : super(key: key);

  @override
  PantallaPrincipalImpl createState() => PantallaPrincipalImpl();
}

class PantallaPrincipalImpl extends State<PantallaPrincipal> {
  Color colorFondoMenu;

  @override
  void initState() {
    super.initState();
    setColor();
  }

  Future<void> setColor() async {
    ParametroDAO.getParametro("colorFondoMenu").then((content) {
      setState(() {
        colorFondoMenu = ColorParser.hex(content.valor).getColor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: colorFondoMenu,
        ),
        child: MenuPrincipal(),
      ),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlexibleLogoHome(),
        FlexibleSonidos(),
        SizedBox(height: 30),
        FlexibleConfiguracion(),
        SizedBox(height: 30),
        FlexibleSalir(),
      ],
    );
  }
}

class FlexibleLogoHome extends StatelessWidget {
  const FlexibleLogoHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: Image.asset('assets/images/logo_home.png',
            width: MediaQuery.of(context).size.width * 1),
      ),
      flex: 4,
    );
  }
}

class FlexibleSonidos extends StatefulWidget {
  FlexibleSonidos({Key key}) : super(key: key);

  @override
  FlexibleSonidosImpl createState() => FlexibleSonidosImpl();
}

class FlexibleSonidosImpl extends State<FlexibleSonidos> {
  Color colorBoton;

  @override
  void initState() {
    super.initState();
    setColor();
  }

  Future<void> setColor() async {
    ParametroDAO.getParametro("colorBotonSonidos").then((content) {
      setState(() {
        colorBoton = ColorParser.hex(content.valor).getColor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ButtonTheme(
        minWidth: 200,
        height: 35,
        child: RaisedButton(
          child: Text('Sonidos'),
          color: colorBoton,
          textColor: useWhiteForeground(colorBoton)
              ? const Color(0xffffffff)
              : const Color(0xff000000),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BarraNavegacion(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FlexibleConfiguracion extends StatefulWidget {
  FlexibleConfiguracion({Key key}) : super(key: key);

  @override
  FlexibleConfiguracionImpl createState() => FlexibleConfiguracionImpl();
}

class FlexibleConfiguracionImpl extends State<FlexibleConfiguracion> {
  Color colorBoton;

  @override
  void initState() {
    super.initState();
    setColor();
  }

  Future<void> setColor() async {
    ParametroDAO.getParametro("colorBotonConfig").then((content) {
      setState(() {
        colorBoton = ColorParser.hex(content.valor).getColor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ButtonTheme(
        minWidth: 200,
        height: 35,
        child: RaisedButton(
          child: Text('Configuración'),
          color: colorBoton,
          textColor: useWhiteForeground(colorBoton)
              ? const Color(0xffffffff)
              : const Color(0xff000000),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PantallaConfiguracion(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FlexibleSalir extends StatefulWidget {
  FlexibleSalir({Key key}) : super(key: key);

  @override
  FlexibleSalirImpl createState() => FlexibleSalirImpl();
}

class FlexibleSalirImpl extends State<FlexibleSalir> {
  Color colorBoton;

  @override
  void initState() {
    super.initState();
    setColor();
  }

  Future<void> setColor() async {
    ParametroDAO.getParametro("colorBotonSalir").then((content) {
      setState(() {
        colorBoton = ColorParser.hex(content.valor).getColor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ButtonTheme(
        minWidth: 200,
        height: 35,
        child: RaisedButton(
          child: Text('Salir'),
          color: colorBoton,
          textColor: useWhiteForeground(colorBoton)
              ? const Color(0xffffffff)
              : const Color(0xff000000),
          onPressed: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          },
        ),
      ),
    );
  }
}

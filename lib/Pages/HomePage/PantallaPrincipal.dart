import 'package:botonera_app/Pages/HomePage/Botones/BotonConfiguracion.dart';
import 'package:botonera_app/Pages/HomePage/Botones/BotonCreditos.dart';
import 'package:botonera_app/Pages/HomePage/Botones/BotonSalir.dart';
import 'package:botonera_app/Pages/HomePage/Botones/BotonSonidos.dart';
import 'package:botonera_app/Pages/HomePage/LogoHome.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PantallaPrincipal extends StatefulWidget {
  PantallaPrincipal({Key key}) : super(key: key);

  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color:
              ColorParser.hex(paramsProvider.colorFondoMenu.valor).getColor(),
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
        SizedBox(height: 50),
        LogoHome(),
        SizedBox(height: 50),
        BotonSonidos(),
        SizedBox(height: 50),
        BotonConfiguracion(),
        SizedBox(height: 50),
        BotonCreditos(),
        SizedBox(height: 50),
        BotonSalir(),
      ],
    );
  }
}

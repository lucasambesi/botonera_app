import 'package:botonera_app/Pages/HomePage/Botones/BotonConfiguracion.dart';
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
  PantallaPrincipalImpl createState() => PantallaPrincipalImpl();
}

class PantallaPrincipalImpl extends State<PantallaPrincipal> {
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

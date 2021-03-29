import 'package:botonera_app/Pages/HomePage/BotonConfiguracion.dart';
import 'package:botonera_app/Pages/HomePage/BotonSalir.dart';
import 'package:botonera_app/Pages/HomePage/BotonSonidos.dart';
import 'package:botonera_app/Pages/HomePage/LogoHome.dart';
import 'package:botonera_app/db/ParametroDAO.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageImpl createState() => HomePageImpl();
}

class HomePageImpl extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ParametroDAO.getParametros(),
      builder: builderChangeNotifierProvider,
    );
  }

  Widget builderChangeNotifierProvider(
      BuildContext context, AsyncSnapshot<List<Parametro>> snapshot) {
    if (snapshot.hasError) {
      return Center(
        child: Text('ERROR: ${snapshot.error.toString()}'),
      );
    }
    if (!snapshot.hasData) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ChangeNotifierProvider<ParametrosProvider>(
      create: (_) => ParametrosProvider(
        parametros: snapshot.data,
      ),
      child: MaterialApp(
        title: 'Botonera.App',
        home: PantallaPrincipal(),
      ),
    );
  }
}

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

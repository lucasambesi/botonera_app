import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/SenttingsPage/SenttingsPage.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BotonConfiguracion extends StatefulWidget {
  BotonConfiguracion({Key key}) : super(key: key);

  @override
  _BotonConfiguracionState createState() => _BotonConfiguracionState();
}

class _BotonConfiguracionState extends State<BotonConfiguracion> {
  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return Flexible(
      flex: 1,
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: RaisedButton(
          child: Text('Configuración'),
          color: Helpers.getColorByParam(paramsProvider.colorBotonConfig),
          textColor:
              Helpers.getColorConstrastByParam(paramsProvider.colorBotonConfig),
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

import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform, exit;
import 'package:flutter/services.dart';

class BotonSalir extends StatefulWidget {
  BotonSalir({Key key}) : super(key: key);

  @override
  _BotonSalirState createState() => _BotonSalirState();
}

class _BotonSalirState extends State<BotonSalir> {
  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return Flexible(
      flex: 1,
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: RaisedButton(
          child: Text('Salir'),
          color: Helpers.getColorByParam(paramsProvider.colorBotonSalir),
          textColor:
              Helpers.getColorConstrastByParam(paramsProvider.colorBotonSalir),
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

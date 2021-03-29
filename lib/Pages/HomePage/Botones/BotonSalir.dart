import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform, exit;
import 'package:flutter/services.dart';

class FlexibleSalir extends StatefulWidget {
  FlexibleSalir({Key key}) : super(key: key);

  @override
  FlexibleSalirImpl createState() => FlexibleSalirImpl();
}

class FlexibleSalirImpl extends State<FlexibleSalir> {
  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return Flexible(
      flex: 1,
      child: ButtonTheme(
        minWidth: 200,
        height: 35,
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

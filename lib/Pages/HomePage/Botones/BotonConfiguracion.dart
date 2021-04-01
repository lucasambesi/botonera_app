import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/SenttingsPage/SenttingsPage.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlexibleConfiguracion extends StatefulWidget {
  FlexibleConfiguracion({Key key}) : super(key: key);

  @override
  FlexibleConfiguracionImpl createState() => FlexibleConfiguracionImpl();
}

class FlexibleConfiguracionImpl extends State<FlexibleConfiguracion> {
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

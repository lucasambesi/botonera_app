import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/SoundsPage/BottomNavigationBarSounds.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlexibleSonidos extends StatefulWidget {
  FlexibleSonidos({Key key}) : super(key: key);

  @override
  FlexibleSonidosImpl createState() => FlexibleSonidosImpl();
}

class FlexibleSonidosImpl extends State<FlexibleSonidos> {
  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return Flexible(
      flex: 1,
      child: ButtonTheme(
        minWidth: 200,
        height: 35,
        child: RaisedButton(
          child: Text('Sonidos'),
          color: Helpers.getColorByParam(paramsProvider.colorBotonSonidos),
          textColor: Helpers.getColorConstrastByParam(
              paramsProvider.colorBotonSonidos),
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

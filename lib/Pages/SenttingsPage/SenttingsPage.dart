import 'package:botonera_app/db/AudioDAO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaConfiguracion extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaConfiguracionImpl();
}

class PantallaConfiguracionImpl extends State<PantallaConfiguracion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Center(
          child: Text('Proximamente'),
        ),
      ),
    );
  }
}

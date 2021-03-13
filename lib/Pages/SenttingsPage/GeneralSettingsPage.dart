import 'package:botonera_app/Pages/SenttingsPage/BotonesMenuPrincipal.dart';
import 'package:botonera_app/Pages/SenttingsPage/TemaGeneralAplicacion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaGeneralSettings extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaGeneralSettingsImpl();
}

class PantallaGeneralSettingsImpl extends State<PantallaGeneralSettings> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        TemaGeneralAplicacion(),
        BotonesMenuPrincipal(),
      ],
    );
  }
}

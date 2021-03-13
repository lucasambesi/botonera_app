import 'package:botonera_app/Pages/SenttingsPage/BarraColores.dart';
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
        Card(
          elevation: 2.0,
          child: SizedBox(
            height: 120.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tema general de Aplicacion:'),
                  Spacer(),
                  BarraColores(
                    nombreParametro: 'colorFondo',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:botonera_app/Pages/SenttingsPage/GeneralSettings/BotonesMenuPrincipal.dart';
import 'package:botonera_app/Pages/SenttingsPage/GeneralSettings/ConfiguracionCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaGeneralSettings extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaGeneralSettingsImpl();
}

class PantallaGeneralSettingsImpl extends State<PantallaGeneralSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: GridView.count(
        crossAxisCount: (2),
        children: <Widget>[
          BotonesMenuPrincipal(),
          ConfiguracionCard(
            nombreTitulo: 'Color fondo Sonidos',
            nombreParametro: 'colorFondoSonidos',
          ),
          ConfiguracionCard(
            nombreTitulo: 'Color fondo Menu Principal',
            nombreParametro: 'colorFondoMenu',
          ),
          ConfiguracionCard(
            nombreTitulo: 'Color barra Superior',
            nombreParametro: 'colorBarraSuperior',
          ),
          ConfiguracionCard(
            nombreTitulo: 'Color barra Inferior',
            nombreParametro: 'colorBarraInferior',
          ),
        ],
      ),
    );
  }
}

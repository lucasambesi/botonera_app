import 'package:botonera_app/Pages/SenttingsPage/BotonesMenuPrincipal.dart';
import 'package:botonera_app/Pages/SenttingsPage/ConfiguracionCard.dart';
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
        Row(
          children: [
            ConfiguracionCard(
              nombreTitulo: 'Color de Fondo Menu',
              nombreParametro: 'colorFondoMenu',
            ),
            ConfiguracionCard(
              nombreTitulo: 'Color de Fondo Sonidos',
              nombreParametro: 'colorFondoSonidos',
            ),
          ],
        ),
        Row(
          children: [
            ConfiguracionCard(
              nombreTitulo: 'Color de Barra Superior',
              nombreParametro: 'colorBarraSuperior',
            ),
            ConfiguracionCard(
              nombreTitulo: 'Color de Barra Inferiror',
              nombreParametro: 'colorBarraInferior',
            ),
          ],
        ),
        BotonesMenuPrincipal(),
      ],
    );
  }
}

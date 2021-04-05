import 'dart:ui' as ui;
import 'package:botonera_app/Pages/SenttingsPage/AudioCategoriaSettings/AudioCardMuestra.dart';
import 'package:botonera_app/Pages/SenttingsPage/AudioCategoriaSettings/CategoriaCardMuestra.dart';
import 'package:botonera_app/Pages/SenttingsPage/GeneralSettings/ConfiguracionCard.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PantallaAudioCategoriaSettings extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaAudioCategoriaSettingsImpl();
}

class PantallaAudioCategoriaSettingsImpl
    extends State<PantallaAudioCategoriaSettings> {
  @override
  Widget build(BuildContext context) {
    var paramsProvider = Provider.of<ParametrosProvider>(
      context,
      listen: false,
    );
    return SingleChildScrollView(
      child: SizedBox(
        height: 900,
        width: MediaQuery.of(context).size.height - 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TituloSetting(
              titulo: 'Categoria',
            ),
            SizedBox(
              height: 8,
            ),
            CategoriaCardMuestra(
              parametro: paramsProvider.colorFondoCategoria,
            ),
            SizedBox(
              height: 8,
            ),
            Divider(),
            TituloSetting(
              titulo: 'Audio',
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: AudioCardMuestra(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ConfiguracionCard(
                      nombreTitulo: 'Color iconos Audio',
                      nombreParametro: 'colorIconosAudio',
                    ),
                  ),
                  Expanded(
                    child: ConfiguracionCard(
                      nombreTitulo: 'Color en Favoritos',
                      nombreParametro: 'colorEnFavoritos',
                    ),
                  ),
                  Expanded(
                    child: ConfiguracionCard(
                      nombreTitulo: 'Color fondo Audio',
                      nombreParametro: 'colorFondoAudio',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ConfiguracionCard(
                      nombreTitulo: 'Color boton Audio',
                      nombreParametro: 'colorBotonAudio',
                    ),
                  ),
                  Expanded(
                    child: ConfiguracionCard(
                      nombreTitulo: 'Color fondo Info',
                      nombreParametro: 'colorFondoInfoAudio',
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class TituloSetting extends StatelessWidget {
  final String titulo;

  const TituloSetting({
    @required this.titulo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: TextStyle(
          fontSize: 35,
          foreground: Paint()
            ..shader = ui.Gradient.linear(
              const Offset(0, 150),
              const Offset(230, 0),
              <Color>[
                Colors.red,
                Colors.yellow,
              ],
            )),
    );
  }
}

import 'package:botonera_app/Pages/SenttingsPage/AudioCategoriaSettings/AudioCardMuestra.dart';
import 'package:botonera_app/Pages/SenttingsPage/AudioCategoriaSettings/CategoriaCardMuestra.dart';
import 'package:botonera_app/Pages/SenttingsPage/AudioCategoriaSettings/TituloSettings.dart';
import 'package:botonera_app/Pages/SenttingsPage/GeneralSettings/ConfiguracionCard.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioCategoriaSettings extends StatefulWidget {
  State<StatefulWidget> createState() => _AudioCategoriaSettingsState();
}

class _AudioCategoriaSettingsState extends State<AudioCategoriaSettings> {
  @override
  Widget build(BuildContext context) {
    var paramsProvider = Provider.of<ParametrosProvider>(
      context,
      listen: false,
    );
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 150,
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
                  Expanded(
                    child: ConfiguracionCard(
                      nombreTitulo: 'Color boton Audio',
                      nombreParametro: 'colorBotonAudio',
                    ),
                  ),
                  Container(
                    child: AudioCardMuestra(),
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

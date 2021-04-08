import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/SoundsPage/AudioCard/IconoFavorito.dart';
import 'package:botonera_app/db/DAOs/AudioDAO.dart';
import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class IconosInferiores extends StatefulWidget {
  final Audio audio;
  IconosInferiores({@required this.audio});

  State<StatefulWidget> createState() => _IconosInferioresState(audio: audio);
}

class _IconosInferioresState extends State<IconosInferiores> {
  final Audio audio;
  Color _color;
  double sizeIcons;
  _IconosInferioresState({@required this.audio});

  @override
  void initState() {
    super.initState();
    sizeIcons = 27;
    _color = (audio.favorito) ? Colors.yellow : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    Color colorIconos =
        Helpers.getColorByParam(paramsProvider.colorIconosAudio);
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        iconoInformacion(
            context, paramsProvider.colorFondoInfoAudio, colorIconos),
        IconoFavorito(
          sizeIcons: sizeIcons,
          audio: audio,
        ),
        iconoCompartir(colorIconos),
      ],
    );
  }

  IconButton iconoInformacion(
      BuildContext context, Parametro colorFondoInfoAudio, Color color) {
    return IconButton(
      icon: Icon(
        Icons.info_outline,
        size: sizeIcons,
        color: color,
      ),
      tooltip: 'Información',
      onPressed: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Helpers.getColorByParam(colorFondoInfoAudio),
            title: Text(
              'Información del audio',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Helpers.getColorConstrastByParam(colorFondoInfoAudio),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Nombre:  "' + audio.nombre + '".',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color:
                        Helpers.getColorConstrastByParam(colorFondoInfoAudio),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Categoría:  "' + audio.categoria.nombre + '".',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color:
                        Helpers.getColorConstrastByParam(colorFondoInfoAudio),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'En Favoritos: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Helpers.getColorConstrastByParam(
                            colorFondoInfoAudio),
                      ),
                    ),
                    Icon(
                      (audio.favorito ? Icons.check : Icons.close),
                      color: (audio.favorito ? Colors.green : Colors.red),
                    ),
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Cerrar',
                  style: TextStyle(
                    color:
                        Helpers.getColorConstrastByParam(colorFondoInfoAudio),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ).then(
          (content) {
            if (content.toString().isNotEmpty) setState(() {});
          },
        );
      },
    );
  }

  IconButton iconoFavorito(Color color) {
    return IconButton(
      icon: Icon(
        Icons.star,
        size: sizeIcons,
      ),
      tooltip: 'Agregar a Favoritos',
      color: _color,
      onPressed: () {
        setState(
          () {
            if (_color == Colors.black) {
              _color = Colors.yellow;
              audio.favorito = true;
            } else {
              _color = Colors.black;
              audio.favorito = false;
            }
            AudioDAO.updateAudio(audio);
          },
        );
      },
    );
  }

  IconButton iconoCompartir(Color color) {
    return IconButton(
      icon: Icon(
        Icons.share,
        size: sizeIcons,
        color: color,
      ),
      tooltip: 'Compartir',
      onPressed: () async {
        String nombreAudio = audio.nombre;
        // final ByteData bytes =
        //     await rootBundle.load('assets/audios/$nombreAudio.mp3');

        final ByteData bytes =
            await rootBundle.load('assets/images/logo_home.png');
        Share.file(
            nombreAudio, nombreAudio, bytes.buffer.asInt8List(), 'image/jpg');
      },
    );
  }
}

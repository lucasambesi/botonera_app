import 'package:botonera_app/db/AudioDAO.dart';
import 'package:botonera_app/models/Audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';

class IconosInferiores extends StatefulWidget {
  final Audio audio;
  IconosInferiores({@required this.audio});

  State<StatefulWidget> createState() => IconosInferioresImpl(audio: audio);
}

class IconosInferioresImpl extends State<IconosInferiores> {
  final Audio audio;
  Color _color;
  double sizeIcons;
  IconosInferioresImpl({@required this.audio});

  @override
  void initState() {
    super.initState();
    sizeIcons = 25;
    _color = (audio.favorito) ? Colors.yellow : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          iconoInformacion(context),
          iconoFavorito(),
          iconoCompartir(),
        ],
      ),
    );
  }

  IconButton iconoInformacion(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.info_outline,
        size: sizeIcons,
      ),
      tooltip: 'Información',
      onPressed: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Información del audio',
              textAlign: TextAlign.center,
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
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Categoría:  "' + audio.categoria.nombre + '".',
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'En Favoritos: ',
                      textAlign: TextAlign.left,
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

  IconButton iconoFavorito() {
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
              AudioDAO.updateAudio(audio);
            } else {
              _color = Colors.black;
              audio.favorito = false;
              AudioDAO.updateAudio(audio);
            }
          },
        );
      },
    );
  }

  IconButton iconoCompartir() {
    return IconButton(
      icon: Icon(
        Icons.share,
        size: sizeIcons,
      ),
      tooltip: 'Compartir',
      onPressed: () async {
        String nombreAudio = audio.nombre;
        // final ByteData bytes =
        //     await rootBundle.load('assets/audios/$nombreAudio.mp3');

        final ByteData bytes =
            await rootBundle.load('assets/images/logo_home.jpg');
        Share.file(
            nombreAudio, nombreAudio, bytes.buffer.asInt8List(), 'image/jpg');
      },
    );
  }
}

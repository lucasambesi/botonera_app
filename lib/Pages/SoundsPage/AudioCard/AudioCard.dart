import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/SoundsPage/AudioCard/BotonAudio.dart';
import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/Pages/SoundsPage/AudioCard/IconosInferiores.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

class AudioCard extends StatefulWidget {
  final Audio audio;
  AudioCard({@required this.audio});

  State<StatefulWidget> createState() => _AudioCardState(audio: audio);
}

class _AudioCardState extends State<AudioCard> {
  final Audio audio;
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  _AudioCardState({@required this.audio});

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return Card(
      color: Helpers.getColorByParam(paramsProvider.colorFondoAudio),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: cardImpl(paramsProvider.colorFondoAudio),
          ),
        ),
      ),
    );
  }

  List<Widget> cardImpl(Parametro parametro) {
    return <Widget>[
      Flexible(
        flex: 3,
        fit: FlexFit.tight,
        child: Text(
          (audio.nombre.length <= 27) ? audio.nombre : cortarAudioNombre(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Helpers.getColorConstrastByParam(parametro)),
        ),
      ),
      Flexible(
        flex: 4,
        fit: FlexFit.tight,
        child: BotonAudio(
          audioCache: audioCache,
          nombreAudio: audio.nombre,
          tipoReproducir: true,
        ),
      ),
      Flexible(
        flex: 5,
        fit: FlexFit.tight,
        child: IconosInferiores(
          audio: audio,
        ),
      ),
    ];
  }

  String cortarAudioNombre() {
    List<String> cadena = audio.nombre.split(' ');
    String cadena2 = '';
    for (int i = 0; i <= 4; i++) {
      cadena2 += cadena[i] + ' ';
    }
    cadena2 += '...';
    return cadena2;
  }
}

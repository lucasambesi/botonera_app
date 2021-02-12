import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/Pages/SoundsPage/IconosInferiores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioCard extends StatefulWidget {
  final Audio audio;
  AudioCard({@required this.audio});

  State<StatefulWidget> createState() => AudioCardImpl(audio: audio);
}

class AudioCardImpl extends State<AudioCard> {
  final Audio audio;
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  AudioCardImpl({@required this.audio});

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: cardImpl,
          ),
        ),
      ),
    );
  }

  List<Widget> get cardImpl {
    return <Widget>[
      Flexible(
        flex: 3,
        fit: FlexFit.tight,
        child: Text(
          (audio.nombre.length <= 27) ? audio.nombre : cortarAudioNombre(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
      Flexible(
        flex: 4,
        fit: FlexFit.loose,
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

class BotonAudio extends StatefulWidget {
  final AudioCache audioCache;
  final String nombreAudio;
  final bool tipoReproducir;

  State<StatefulWidget> createState() => BotonAudioImpl(
        audioCache: audioCache,
        nombreAudio: nombreAudio,
        tipoReproducir: tipoReproducir,
      );

  BotonAudio({
    @required this.audioCache,
    @required this.nombreAudio,
    @required this.tipoReproducir,
  });
}

class BotonAudioImpl extends State<BotonAudio> {
  final AudioCache audioCache;
  final String nombreAudio;
  bool tipoReproducir;

  BotonAudioImpl({
    @required this.audioCache,
    @required this.nombreAudio,
    @required this.tipoReproducir,
  });

  @override
  void initState() {
    super.initState();

    audioCache.fixedPlayer.completionHandler = () {
      setState(
        () {
          tipoReproducir = true;
        },
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        if (tipoReproducir)
          audioCache.play('audios/$nombreAudio.mp3');
        else
          audioCache.fixedPlayer.stop();
        setState(
          () {
            tipoReproducir = !tipoReproducir;
          },
        );
      },
      child: Icon(
        (tipoReproducir) ? Icons.play_arrow : Icons.stop,
        color: Colors.white,
        size: 30,
      ),
      shape: CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.yellow[300],
      padding: const EdgeInsets.all(15.0),
    );
  }
}

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

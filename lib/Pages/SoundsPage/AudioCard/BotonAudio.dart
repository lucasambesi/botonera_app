import 'package:audioplayers/audio_cache.dart';
import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BotonAudio extends StatefulWidget {
  final AudioCache audioCache;
  final String nombreAudio;
  final bool tipoReproducir;

  State<StatefulWidget> createState() => _BotonAudioState(
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

class _BotonAudioState extends State<BotonAudio> {
  final AudioCache audioCache;
  final String nombreAudio;
  bool tipoReproducir;

  _BotonAudioState({
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
    final paramsProvider = Provider.of<ParametrosProvider>(context);
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
        color: Helpers.getColorByParam(paramsProvider.colorFondoAudio),
        size: 30,
      ),
      shape: CircleBorder(),
      elevation: 2.0,
      fillColor: Helpers.getColorByParam(paramsProvider.colorBotonAudio),
      padding: const EdgeInsets.all(15.0),
    );
  }
}

import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/Pages/SoundsPage/IconosInferiores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class BotonCard extends StatefulWidget {
  final Audio audio;
  BotonCard({@required this.audio});

  State<StatefulWidget> createState() => BotonCardImpl(audio: audio);
}

class BotonCardImpl extends State<BotonCard> {
  final Audio audio;
  AudioPlayer audioPlayer;
  AudioCache audioCache;

  BotonCardImpl({@required this.audio});

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: cardImpl,
          ),
        ),
      ),
    );
  }

  List<Widget> get cardImpl {
    return <Widget>[
      CardAudio(
        audioCache: audioCache,
        nombreAudio: audio.nombre,
      ),
      SizedBox(
        height: 8,
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        audio.nombre,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 8,
      ),
      IconosInferiores(
        audio: audio,
      ),
    ];
  }
}

class CardAudio extends StatelessWidget {
  final AudioCache audioCache;
  final String nombreAudio;

  const CardAudio({
    Key key,
    @required this.audioCache,
    @required this.nombreAudio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Click'),
      onPressed: () {
        audioCache.play('audios/$nombreAudio.mp3');
      },
    );
  }
}

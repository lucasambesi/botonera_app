import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class BotonCard extends StatefulWidget {
  final String audio;
  BotonCard({@required this.audio});

  State<StatefulWidget> createState() => BotonCardImpl(audio: audio);
}

class BotonCardImpl extends State<BotonCard> {
  final String audio;
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
            children: <Widget>[
              RaisedButton(
                child: Text('Click'),
                onPressed: () {
                  audioCache.play(audio + '.mp3');
                },
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                audio,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

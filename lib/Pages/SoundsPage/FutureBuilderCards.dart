import 'package:botonera_app/Pages/SoundsPage/ButtomCard.dart';
import 'package:botonera_app/db/AudioDAO.dart';
import 'package:botonera_app/models/Audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderCards extends StatefulWidget {
  final Function callback;
  FutureBuilderCards({@required this.callback});

  State<StatefulWidget> createState() =>
      FutureBuilderCardsImpl(callback: callback);
}

class FutureBuilderCardsImpl extends State<FutureBuilderCards> {
  Function callback;

  FutureBuilderCardsImpl({@required this.callback});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAudiosBotonCard(callback: callback),
      builder: builderGridViewAudios,
    );
  }

  static Future<List<Widget>> getAudiosBotonCard({@required callback}) async {
    List<Widget> _widgets = new List<Widget>();
    List<Audio> audios = await callback();

    for (int i = 0; i < audios.length; i++) {
      _widgets.add(
        BotonCard(
          audio: audios[i],
        ),
      );
    }

    return _widgets;
  }

  Widget builderGridViewAudios(
      BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
    if (snapshot.hasError) {
      return Center(
        child: Text('ERROR: ${snapshot.error.toString()}'),
      );
    }
    if (!snapshot.hasData) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return GridView.count(
      crossAxisCount: (3),
      children: snapshot.data,
    );
  }
}

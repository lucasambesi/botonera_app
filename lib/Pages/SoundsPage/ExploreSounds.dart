import 'package:botonera_app/Pages/SoundsPage/ButtomCard.dart';
import 'package:botonera_app/db/AudioDAO.dart';
import 'package:botonera_app/models/Audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaExplorarSonidos extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaExplorarImpl();
}

class PantallaExplorarImpl extends State<PantallaExplorarSonidos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: getAudiosBotonCard(),
          builder: builderGridViewAudios,
        ),
      ),
    );
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

  static Future<List<Widget>> getAudiosBotonCard() async {
    List<Widget> _widgets = new List<Widget>();
    List<Audio> audios = await AudioDAO.getAudios();

    for (int i = 0; i < audios.length; i++) {
      _widgets.add(
        BotonCard(
          audio: audios[i],
        ),
      );
    }

    return _widgets;
  }
}

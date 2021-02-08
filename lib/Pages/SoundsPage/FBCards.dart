import 'package:botonera_app/Pages/SoundsPage/AudioCard.dart';
import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/models/Categoria.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderCards extends StatefulWidget {
  final Function callback;
  final Categoria categoria;
  FutureBuilderCards({@required this.callback, this.categoria});

  State<StatefulWidget> createState() =>
      FutureBuilderCardsImpl(callback: callback, categoria: categoria);
}

class FutureBuilderCardsImpl extends State<FutureBuilderCards> {
  Function callback;
  final Categoria categoria;

  FutureBuilderCardsImpl({@required this.callback, this.categoria});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAudiosBotonCard(callback: callback, categoria: categoria),
      builder: builderGridViewAudios,
    );
  }

  static Future<List<Widget>> getAudiosBotonCard(
      {@required callback, Categoria categoria}) async {
    List<Widget> _widgets = new List<Widget>();
    List<Audio> audios;

    if (categoria != null)
      audios = await callback(categoria);
    else
      audios = await callback();

    for (int i = 0; i < audios.length; i++) {
      _widgets.add(
        AudioCard(
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
      crossAxisCount: (2),
      children: snapshot.data,
    );
  }
}

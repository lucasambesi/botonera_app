import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:botonera_app/db/DAOs/AudioDAO.dart';
import 'package:provider/provider.dart';

class IconoFavorito extends StatefulWidget {
  final Audio audio;
  final double sizeIcons;
  IconoFavorito({
    @required this.audio,
    @required this.sizeIcons,
  });

  State<StatefulWidget> createState() => IconoFavoritoImpl(
        audio: audio,
        sizeIcons: sizeIcons,
      );
}

class IconoFavoritoImpl extends State<IconoFavorito> {
  final Audio audio;
  ParametrosProvider parametrosProvider;
  double sizeIcons;
  Color _color;
  Color enFavoritos;
  Color noFavoritos;

  IconoFavoritoImpl({
    @required this.audio,
    @required this.sizeIcons,
  });

  @override
  void initState() {
    super.initState();
    parametrosProvider = Provider.of<ParametrosProvider>(
      context,
      listen: false,
    );

    sizeIcons = 27;
    enFavoritos = Helpers.getColorByParam(parametrosProvider.colorEnFavoritos);
    noFavoritos = Helpers.getColorByParam(parametrosProvider.colorIconosAudio);
    _color = (audio.favorito) ? enFavoritos : noFavoritos;
  }

  @override
  Widget build(BuildContext context) {
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
            if (_color == noFavoritos) {
              _color = enFavoritos;
              audio.favorito = true;
            } else {
              _color = noFavoritos;
              audio.favorito = false;
            }
            AudioDAO.updateAudio(audio);
          },
        );
      },
    );
  }
}

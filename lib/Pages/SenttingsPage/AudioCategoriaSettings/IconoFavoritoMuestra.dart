import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconoFavoritoMuestra extends StatefulWidget {
  const IconoFavoritoMuestra();
  State<StatefulWidget> createState() => IconoFavoritoMuestraState();
}

class IconoFavoritoMuestraState extends State<IconoFavoritoMuestra> {
  ParametrosProvider parametrosProvider;
  Color _color;
  Color enFavoritos;
  Color noFavoritos;

  IconoFavoritoMuestraState();

  @override
  void initState() {
    super.initState();
    parametrosProvider = Provider.of<ParametrosProvider>(
      context,
      listen: false,
    );
    setColores();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    parametrosProvider = Provider.of<ParametrosProvider>(
      context,
      listen: true,
    );
    setColores();
  }

  void setColores() {
    enFavoritos = Helpers.getColorByParam(parametrosProvider.colorEnFavoritos);
    noFavoritos = Helpers.getColorByParam(parametrosProvider.colorIconosAudio);
    _color = noFavoritos;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.star,
        size: 27,
      ),
      tooltip: 'Agregar a Favoritos',
      color: _color,
      onPressed: () {
        setState(
            () => _color = (_color == enFavoritos) ? noFavoritos : enFavoritos);
      },
    );
  }
}

import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/FileOperations/FileUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconosInferiores extends StatefulWidget {
  final Audio audio;
  IconosInferiores({@required this.audio});

  State<StatefulWidget> createState() => IconosInferioresImpl(audio: audio);
}

class IconosInferioresImpl extends State<IconosInferiores> {
  final Audio audio;
  Color _color;
  List<Audio> _favoritos;
  IconosInferioresImpl({@required this.audio});

  @override
  void initState() async {
    super.initState();
    _favoritos = await FileUtils.getAudiosFavoritos();
    _color = (audio.favorito) ? Colors.red : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
            tooltip: 'Agregar a Favoritos',
            color: _color,
            onPressed: () {
              setState(
                () {
                  if (_color == Colors.black) {
                    _color = Colors.red;
                    _favoritos.add(audio);
                  } else {
                    _color = Colors.black;
                    eliminarDeFavoritos();
                  }
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void eliminarDeFavoritos() {
    Iterator iterator = _favoritos.iterator;

    while (iterator.moveNext()) {
      Audio iteratorItem = iterator.current;
      if (iteratorItem.nombre == audio.nombre) {
        _favoritos.remove(iteratorItem);
        break;
      }
    }
  }
}

import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/SenttingsPage/AudioCategoriaSettings/IconoFavoritoMuestra.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioCardMuestra extends StatefulWidget {
  State<StatefulWidget> createState() => AudioCardMuestraImpl();
}

class AudioCardMuestraImpl extends State<AudioCardMuestra> {
  bool tipoReproducir;

  @override
  void initState() {
    super.initState();
    tipoReproducir = true;
  }

  @override
  Widget build(BuildContext context) {
    var paramsProvider = Provider.of<ParametrosProvider>(
      context,
    );
    return Card(
      color: Helpers.getColorByParam(paramsProvider.colorFondoAudio),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: cardImpl(paramsProvider),
          ),
        ),
      ),
    );
  }

  List<Widget> cardImpl(ParametrosProvider params) {
    return <Widget>[
      Flexible(
        flex: 3,
        fit: FlexFit.tight,
        child: Text(
          'Audio de muetra',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Helpers.getColorConstrastByParam(params.colorFondoAudio),
          ),
        ),
      ),
      Flexible(
        flex: 4,
        fit: FlexFit.loose,
        child: RawMaterialButton(
          onPressed: () {
            setState(() {
              tipoReproducir = !tipoReproducir;
            });
          },
          child: Icon(
            (tipoReproducir) ? Icons.play_arrow : Icons.stop,
            color: Helpers.getColorByParam(params.colorFondoAudio),
            size: 30,
          ),
          shape: CircleBorder(),
          elevation: 2.0,
          fillColor: Helpers.getColorByParam(params.colorBotonAudio),
          padding: const EdgeInsets.all(15.0),
        ),
      ),
      Flexible(
        flex: 5,
        fit: FlexFit.tight,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 27,
                color: Helpers.getColorByParam(params.colorIconosAudio),
              ),
              tooltip: 'Información',
              onPressed: () {},
            ),
            IconoFavoritoMuestra(),
            IconButton(
              icon: Icon(
                Icons.share,
                size: 27,
                color: Helpers.getColorByParam(params.colorIconosAudio),
              ),
              tooltip: 'Compartir',
              onPressed: () {},
            ),
          ],
        ),
      ),
    ];
  }
}

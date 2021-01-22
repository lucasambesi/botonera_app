import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:botonera_app/FileOperations/FileUtils.dart';

class PantallaExplorarSonidos extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaExplorarImpl();
}

class PantallaExplorarImpl extends State<PantallaExplorarSonidos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: FileUtils.getAudiosByFileName(file: 'base'),
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
}

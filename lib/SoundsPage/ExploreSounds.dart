import 'package:botonera_app/SoundsPage/ButtomCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:botonera_app/FileOperations/FileUtils.dart';

class PantallaExplorar extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaExplorarImpl();
}

class PantallaExplorarImpl extends State<PantallaExplorar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: FileUtils.getAudios(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
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
          },
        ),
      ),
    );
  }
}

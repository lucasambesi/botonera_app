import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotonCard extends StatefulWidget {
  State<StatefulWidget> createState() => BotonCardImpl();
}

class BotonCardImpl extends State<BotonCard> {
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
                child: Text('Test'),
                onPressed: () {},
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Nombre del Boton',
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

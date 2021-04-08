import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

class TituloSetting extends StatelessWidget {
  final String titulo;

  const TituloSetting({
    @required this.titulo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: TextStyle(
          fontSize: 35,
          foreground: Paint()
            ..shader = ui.Gradient.linear(
              const Offset(0, 150),
              const Offset(230, 0),
              <Color>[
                Colors.red,
                Colors.yellow,
              ],
            )),
    );
  }
}

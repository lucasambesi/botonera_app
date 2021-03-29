import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubColor extends StatefulWidget {
  final Color color;

  SubColor({@required this.color});

  State<StatefulWidget> createState() => SubColorImpl(color: color);
}

class SubColorImpl extends State<SubColor> {
  final Color color;
  List<bool> isSelected;

  SubColorImpl({@required this.color});

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}

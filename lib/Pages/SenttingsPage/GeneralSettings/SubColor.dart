import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubColor extends StatefulWidget {
  final Color color;

  SubColor({@required this.color});

  State<StatefulWidget> createState() => _SubColorState(color: color);
}

class _SubColorState extends State<SubColor> {
  final Color color;
  List<bool> isSelected;

  _SubColorState({@required this.color});

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}

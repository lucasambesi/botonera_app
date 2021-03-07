import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarraColores extends StatefulWidget {
  State<StatefulWidget> createState() => BarraColoresImpl();
}

class BarraColoresImpl extends State<BarraColores> {
  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [
      true,
      false,
      false,
      false,
      false,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(20),
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      renderBorder: true,
      children: <Widget>[
        SubColor(
          color: (Colors.yellow[300]),
        ),
        SubColor(
          color: Colors.red[300],
        ),
        SubColor(
          color: Colors.blue[300],
        ),
        SubColor(
          color: Colors.green[300],
        ),
        SubColor(
          color: Colors.purple[300],
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
      },
      isSelected: isSelected,
    );
  }
}

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

import 'package:botonera_app/models/Parametro.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Helpers {
  static Color getColorByParam(Parametro parametro) {
    return ColorParser.hex(parametro.valor).getColor();
  }

  static Color getColorConstrastByParam(Parametro parametro) {
    return useWhiteForeground(Helpers.getColorByParam(parametro))
        ? const Color(0xffffffff)
        : const Color(0xff000000);
  }
}

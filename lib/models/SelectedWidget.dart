import 'package:flutter/cupertino.dart';

class SelectedWidget {
  bool _isSelected;
  Color _color;

  SelectedWidget({
    @required bool isSelected,
    @required Color color,
  }) {
    this._isSelected = isSelected;
    this._color = color;
  }

  bool get isSelected => _isSelected;
  Color get color => _color;

  void setSelected(bool valor) {
    this._isSelected = valor;
  }
}

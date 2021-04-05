import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/models/Categoria.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriaCard extends StatefulWidget {
  final Categoria categoria;
  CategoriaCard({@required this.categoria});

  State<StatefulWidget> createState() =>
      CategoriaCardImpl(categoria: categoria);
}

class CategoriaCardImpl extends State<CategoriaCard> {
  final Categoria categoria;

  CategoriaCardImpl({@required this.categoria});

  @override
  Widget build(BuildContext context) {
    var paramsProvider = Provider.of<ParametrosProvider>(
      context,
      listen: false,
    );
    return Card(
      color: Helpers.getColorByParam(
        paramsProvider.colorFondoCategoria,
      ),
      child: ListTile(
        leading: Icon(
          Icons.category,
          color: Helpers.getColorConstrastByParam(
              paramsProvider.colorFondoCategoria),
        ),
        title: Row(
          children: [
            Text(
              categoria.nombre,
              style: TextStyle(
                color: Helpers.getColorConstrastByParam(
                  paramsProvider.colorFondoCategoria,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

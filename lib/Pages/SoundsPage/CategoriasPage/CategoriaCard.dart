import 'package:botonera_app/models/Categoria.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Card(
      child: ListTile(
        leading: Icon(Icons.category),
        title: Row(
          children: [
            Text(categoria.nombre),
          ],
        ),
      ),
    );
  }
}

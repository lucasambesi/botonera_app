import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:botonera_app/Pages/SoundsPage/CategoriasPage/CategoriaAudiosPage.dart';
import 'package:botonera_app/Pages/SoundsPage/CategoriasPage/CategoriaCard.dart';
import 'package:botonera_app/db/CategoriaDAO.dart';
import 'package:botonera_app/models/Categoria.dart';

class FBCategoriaCards extends StatefulWidget {
  FBCategoriaCards();

  State<StatefulWidget> createState() => FBCategoriaCardsImpl();
}

class FBCategoriaCardsImpl extends State<FBCategoriaCards> {
  FBCategoriaCardsImpl();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategoriasGestureDetectorCard(context: context),
      builder: builderListViewCategorias,
    );
  }

  //Future
  static Future<List<Widget>> getCategoriasGestureDetectorCard(
      {@required BuildContext context}) async {
    List<Widget> _widgets = new List<Widget>();
    List<Categoria> categorias =
        await CategoriaDAO.getCategorias(conAudios: true);

    for (int i = 0; i < categorias.length; i++) {
      _widgets.add(
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoriaAudiosPage(
                  categoria: categorias[i],
                ),
              ),
            );
          },
          child: CategoriaCard(
            categoria: categorias[i],
          ),
        ),
      );
    }

    return _widgets;
  }

  //Builder
  Widget builderListViewCategorias(
      BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
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
    return CategoriasListView(
      categorias: snapshot.data,
    );
  }
}

class CategoriasListView extends StatelessWidget {
  final List<Widget> categorias;

  const CategoriasListView({
    Key key,
    @required this.categorias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: categorias,
    );
  }
}

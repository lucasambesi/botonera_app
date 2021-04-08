import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/CreditsPage/CreditosAlert.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BotonCreditos extends StatefulWidget {
  BotonCreditos({Key key}) : super(key: key);

  @override
  _BotonCreditosState createState() => _BotonCreditosState();
}

class _BotonCreditosState extends State<BotonCreditos> {
  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return Flexible(
      flex: 1,
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: RaisedButton(
          child: Text(
            'Créditos',
          ),
          color: Helpers.getColorByParam(paramsProvider.colorBotonCreditos),
          textColor: Helpers.getColorConstrastByParam(
              paramsProvider.colorBotonCreditos),
          onPressed: () {
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (_) => CretidosAlert(),
            ).then(
              (content) {
                if (content.toString().isNotEmpty) setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}

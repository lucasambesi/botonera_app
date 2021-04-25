import 'package:admob_flutter/admob_flutter.dart';
import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/SenttingsPage/SenttingsPage.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BotonConfiguracion extends StatefulWidget {
  BotonConfiguracion({Key key}) : super(key: key);

  @override
  _BotonConfiguracionState createState() => _BotonConfiguracionState();
}

class _BotonConfiguracionState extends State<BotonConfiguracion> {
  AdmobInterstitial interstitialAd;

  @override
  void initState() {
    super.initState();
    interstitialAd = AdmobInterstitial(
        adUnitId: "ca-app-pub-3940256099942544/1033173712",
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) {
            interstitialAd.load();
          }
        });
    interstitialAd.load();
  }

  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return Flexible(
      flex: 1,
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: RaisedButton(
          child: Text('Configuración'),
          color: Helpers.getColorByParam(paramsProvider.colorBotonConfig),
          textColor:
              Helpers.getColorConstrastByParam(paramsProvider.colorBotonConfig),
          onPressed: () async {
            if (await interstitialAd.isLoaded) interstitialAd.show();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PantallaConfiguracion(),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:provider/provider.dart';

class AdMobBanner extends StatelessWidget {
  final String parametro;
  AdMobBanner({@required this.parametro});

  @override
  Widget build(BuildContext context) {
    final paramsProvider = Provider.of<ParametrosProvider>(context);
    return Container(
      color: Helpers.getColorByParam(
          paramsProvider.getParametroByClave(parametro)),
      child: AdmobBanner(
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        adSize: AdmobBannerSize.FULL_BANNER,
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {},
      ),
    );
  }
}

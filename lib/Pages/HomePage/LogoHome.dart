import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoHome extends StatelessWidget {
  const LogoHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: Image.asset('assets/images/logo_home.png',
            width: MediaQuery.of(context).size.width * 1),
      ),
      flex: 4,
    );
  }
}

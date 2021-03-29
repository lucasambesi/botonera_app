import 'package:flutter/cupertino.dart';

class FlexibleLogoHome extends StatelessWidget {
  const FlexibleLogoHome({
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

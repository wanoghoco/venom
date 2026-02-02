import 'package:flutter/cupertino.dart';

class AppAnimatedLoader extends StatelessWidget {
  const AppAnimatedLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(radius: 30, color: Color(0xff297DD7)),
    );
  }
}

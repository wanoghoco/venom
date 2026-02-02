import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const VenmoApp());
}

class VenmoApp extends StatelessWidget {
  const VenmoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venmo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3D95CE),
        fontFamily: 'SF Pro Display',
      ),
      home: const VenmoLoginScreen(),
    );
  }
}

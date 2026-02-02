import 'package:flutter/material.dart';

class UsernameWidget extends StatelessWidget {
  const UsernameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'ED',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1A1A1A).withValues(alpha: 0.7),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          right: -10,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                "assets/qr.png",
                height: 22,
                color: const Color(0xFF333333),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

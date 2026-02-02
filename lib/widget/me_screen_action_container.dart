import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MeScreenActionContainer extends StatelessWidget {
  final String image;
  final String text;
  const MeScreenActionContainer({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 170, maxHeight: 180),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFF1A1A1A).withValues(alpha: 0.17),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Image.asset(image, height: 43),
          Gap(16),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: Color(0xFF3D7FDD),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

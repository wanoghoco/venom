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
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFF1A1A1A).withValues(alpha: 0.1),
          width: 2,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Gap(4),
            Image.asset(image, height: 43),
            Gap(16),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3D7FDD),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

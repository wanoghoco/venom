import 'package:flutter/material.dart';

class BottomSheetSelector extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String title;
  final String subTitle;
  final Function() onTap;
  final IconData icons;
  const BottomSheetSelector({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.subTitle,
    required this.title,
    required this.onTap,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,

        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: index == currentIndex
                ? const Color(0xFF297DD7)
                : const Color(0xFFE0E0E0),
          ),
        ),
        child: FittedBox(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF297DD7),
                  shape: BoxShape.circle,
                ),
                child: Icon(icons, color: Colors.white, size: 24),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

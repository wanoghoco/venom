import 'package:flutter/material.dart';

class MeSelector extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String text;
  final Function() onTap;
  const MeSelector({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: index == currentIndex ? Color(0xffFFFFFF) : Colors.transparent,
        ),
        margin: EdgeInsets.all(4),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: index == currentIndex
                  ? Color(0xff2C2C2E)
                  : Color(0xff1A1A1A).withValues(alpha: 0.5),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

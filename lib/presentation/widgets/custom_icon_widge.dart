import 'dart:math';

import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    super.key,
    required this.icon,
    required this.title,
    this.fontSize = 16,
    this.iconSize = 30,
    this.textColor = kwhite,
    this.angle = 180 * pi / 90,
  });

  final IconData icon;
  final String title;
  final double iconSize;
  final double fontSize;
  final Color textColor;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Transform.rotate(
            angle: angle,
            child: Icon(
              icon,
              color: kwhite,
              size: iconSize,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

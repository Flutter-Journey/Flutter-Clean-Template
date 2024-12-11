/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-11 07:31:40
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/configs/theme/app_color.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;
  final double textSize;
  final FontWeight weight;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height = 70,
    this.textSize = 26,
    this.weight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height)),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: weight,
          color: AppColors.darkGrey,
          fontSize: textSize,
        ),
      ),
    );
  }
}

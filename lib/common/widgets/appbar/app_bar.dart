/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-11 07:31:40
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/common/helpers/is_dark_mode.dart';
import 'package:flutter_clean_architecture_template/core/configs/theme/app_color.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget action;
  final bool hiveBack;
  final Color backgroundColor;

  const BasicAppBar({
    super.key,
    this.hiveBack = false,
    this.title = const Text(''),
    this.action = const SizedBox(),
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0,
      actions: [
        action,
      ],
      leading: hiveBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? AppColors.white.withOpacity(0.03)
                      : AppColors.dark.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: context.isDarkMode ? AppColors.white : AppColors.dark,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

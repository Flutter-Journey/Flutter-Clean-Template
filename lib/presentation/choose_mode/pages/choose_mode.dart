import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/common/helpers/is_dark_mode.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_clean_architecture_template/common/widgets/button/basic_app_button.dart';
import 'package:flutter_clean_architecture_template/core/configs/assets/app_images.dart';
import 'package:flutter_clean_architecture_template/core/configs/assets/app_vectors.dart';
import 'package:flutter_clean_architecture_template/core/configs/theme/app_color.dart';
import 'package:flutter_clean_architecture_template/presentation/auth/pages/signup_or_signin.dart';
import 'package:flutter_clean_architecture_template/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //
          // TODO: Case use BackGround
          //
          // Container(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 40,
          //     vertical: 50,
          //   ),
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: AssetImage(
          //         AppImages.chooseMadeBG,
          //       ),
          //     ),
          //   ),
          //   // child:
          // ),
          // Container(
          //   color: Colors.black.withOpacity(0.5),
          // ),
          //

          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    context.isDarkMode
                        ? AppImages.logoDark
                        : AppImages.logoLight,
                  ),
                ),
                const Spacer(),
                Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        context.isDarkMode ? AppColors.white : AppColors.dark,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 87, sigmaY: 87),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: context.isDarkMode
                                        ? AppColors.white.withOpacity(0.3)
                                        : AppColors.dark.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                  height: 73,
                                  width: 73,
                                  child: SvgPicture.asset(
                                    AppVectors.moon,
                                    fit: BoxFit.none,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Dark Mode",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: context.isDarkMode
                                ? AppColors.grey
                                : AppColors.darkGrey,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.light);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 87, sigmaY: 87),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.isDarkMode
                                      ? AppColors.white.withOpacity(0.3)
                                      : AppColors.dark.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                                height: 73,
                                width: 73,
                                child: SvgPicture.asset(
                                  AppVectors.sun,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Light Mode",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: context.isDarkMode
                                ? AppColors.grey
                                : AppColors.darkGrey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SignupOrSignin(),
                      ),
                    );
                  },
                  title: "Continue",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

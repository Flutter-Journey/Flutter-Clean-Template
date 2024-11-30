import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/common/helpers/is_dark_mode.dart';
import 'package:flutter_clean_architecture_template/common/widgets/button/basic_app_button.dart';
import 'package:flutter_clean_architecture_template/core/configs/assets/app_images.dart';
import 'package:flutter_clean_architecture_template/core/configs/theme/app_color.dart';
import 'package:flutter_clean_architecture_template/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
          //         AppImages.introBG,
          //       ),
          //     ),
          //   ),
          //   // child:
          // ),
          // Container(
          //   color: context.isDarkMode ? AppColors.dark : AppColors.white,
          // ),
          //

          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    context.isDarkMode
                        ? AppImages.logoDark
                        : AppImages.logoLight,
                  ),
                ),
                const Spacer(),
                Text(
                  'Flutter Journey',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color:
                        context.isDarkMode ? AppColors.white : AppColors.dark,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Our goal is to share our knowledge through helpful project, create a positive open source community '
                  'that helps developers improve their Flutter skills. We focus on clear, achievable tasks '
                  'and encourage learning by doing',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: context.isDarkMode
                        ? AppColors.greyTitle
                        : AppColors.dark,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 100,
                ),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ChooseModePage(),
                      ),
                    );
                  },
                  title: "Get Start",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

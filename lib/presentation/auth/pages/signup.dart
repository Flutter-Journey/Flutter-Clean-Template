/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-11 07:31:40
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/common/widgets/appbar/app_bar.dart';
import 'package:flutter_clean_architecture_template/common/widgets/button/basic_app_button.dart';
import 'package:flutter_clean_architecture_template/core/configs/theme/app_color.dart';
import 'package:flutter_clean_architecture_template/presentation/auth/pages/singin.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const BasicAppBar(
            //
            // TODO: If have LogoIcon
            //
            // title: Image.asset(
            //   context.isDarkMode ? AppImages.logoIconDark : AppImages.logoIconLight,
            //   height: 40,
            //   width: 40,
            // ),
            ),
        bottomNavigationBar: _signinText(context),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 25),
              _supportText(),
              const SizedBox(height: 25),
              _fullNameField(context),
              const SizedBox(height: 20),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 30),
              BasicAppButton(
                onPressed: () async {
                  //
                  // TODO: Home Screen, SignUp UseCase
                  //
                  // var result = await sl<SignupUseCase>().call(
                  //   params: CreateUserReq(
                  //     email: _email.text.toString(),
                  //     fullName: _fullName.text.toString(),
                  //     password: _password.text.toString(),
                  //   ),
                  // );

                  // result.fold(
                  //   (l) {
                  //     var snackBar = SnackBar(
                  //       content: Text(l),
                  //       behavior: SnackBarBehavior.floating,
                  //     );
                  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //   },
                  //   (r) {
                  //     Navigator.pushAndRemoveUntil(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (BuildContext context) => const HomePage(),
                  //       ),
                  //       (route) => false,
                  //     );
                  //   },
                  // );
                },
                title: "Create Account",
                textSize: 22,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _supportText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "If You Need Any Support ",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Click here",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(
        hintText: "Full Name",
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: "Enter Email",
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: "Password",
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Do You Have An Account?",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SigninPage(),
                ),
              );
            },
            child: const Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

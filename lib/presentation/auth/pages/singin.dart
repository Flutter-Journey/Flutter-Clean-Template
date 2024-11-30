import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/common/widgets/appbar/app_bar.dart';
import 'package:flutter_clean_architecture_template/common/widgets/button/basic_app_button.dart';
import 'package:flutter_clean_architecture_template/core/configs/theme/app_color.dart';
import 'package:flutter_clean_architecture_template/presentation/auth/pages/signup.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

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
        bottomNavigationBar: _registerText(context),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signinText(),
              const SizedBox(height: 25),
              _supportText(),
              const SizedBox(height: 25),
              _usernameOrEmailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 16),
              _recoveryPasswordText(),
              const SizedBox(height: 16),
              BasicAppButton(
                title: 'Sign in',
                onPressed: () async {
                  //
                  // TODO: HomeScreen, Signin UseCase
                  //
                  // var result = await sl<SigninUseCase>().call(
                  //   params: SigninUserReq(
                  //     email: _email.text.toString(),
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
                textSize: 22,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
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

  Widget _usernameOrEmailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: "Enter Username Or Email",
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: "Password",
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _recoveryPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "Recovery Password",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _registerText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Not A Member ? ",
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
                  builder: (BuildContext context) => SignupPage(),
                ),
              );
            },
            child: const Text(
              "Register Now",
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

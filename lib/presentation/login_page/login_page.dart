import 'package:flutter/material.dart';
import 'package:weather_app/helper/size_customize.dart';
import 'package:weather_app/presentation/login_page/content/custom_login_form.dart';
import 'package:weather_app/style/colors.dart';
import 'package:weather_app/style/custom_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      body: Stack(
        children: [
          SizedBox(
            height: SizeCustomize.heightScreen(),
            width: SizeCustomize.widthScreen(),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: SizeCustomize.heightScreen(),
              width: SizeCustomize.widthScreen(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: SizeCustomize.heightScreen() * 0.5,
            child: Align(
              child: TitleText(text: "Login", size: SizeCustomize.setSp(40)),
            ),
          ),
          // Form login
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(child: LoginForm()),
            ),
          ),
        ],
      ),
    );
  }
}

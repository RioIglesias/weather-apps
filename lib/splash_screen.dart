import 'package:flutter/material.dart';
import 'package:weather_app/helper/size_customize.dart';
import 'package:weather_app/presentation/login_page/login_page.dart';
import 'package:weather_app/services/geolocation/geolocation.dart';
import 'package:weather_app/style/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeCustomize.heightScreen(),
        width: SizeCustomize.widthScreen(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud, color: Colors.white, size: 60),
            TitleText(text: 'Weather App', size: 25),
          ],
        ),
      ),
    );
  }

  void navigate() async {
    await getLocation();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }
}

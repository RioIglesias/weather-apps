import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/size_customize.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/style/custom_text.dart';
import 'package:weather_app/presentation/home_page/content/draggable_scroll.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WeatherProvider>(
        builder: (context, value, child) {
          final currentWeather = value.result;
          final dewpoint = value.calculateDewPoint(
            currentWeather!.main.temp,
            currentWeather.main.humidity,
          );
          return Container(
            height: SizeCustomize.heightScreen(),
            width: SizeCustomize.widthScreen(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: SizeCustomize.heightScreen(),
                  width: SizeCustomize.widthScreen(),
                ),
                Positioned(
                  top: SizeCustomize.heightScreen() * 0.3,
                  left: 0,
                  right: 0,
                  height: SizeCustomize.heightScreen() * 0.5,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/House.png'),
                  ),
                ),
                Positioned(
                  top: SizeCustomize.heightScreen() * 0.1,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        TitleText(text: currentWeather.name,),
                        TitleText(
                          text: "${currentWeather.main.temp.toInt()}°",
                          size: SizeCustomize.setSp(90),
                        ),
                        SubText(
                          text:
                              currentWeather.weather[0].description
                                  .toUpperCase(),
                          colors: Colors.grey.shade500,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: DraggableScroll(
                      currentWeather: currentWeather,
                      dewpoint: dewpoint,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

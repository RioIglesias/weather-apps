import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:units_converter/units_converter.dart';
import 'package:weather_app/helper/size_customize.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/presentation/login_page/login_page.dart';
import 'package:weather_app/style/colors.dart';
import 'package:weather_app/style/custom_text.dart';
import 'package:weather_app/widgets/custom_button.dart';
import 'package:weather_app/widgets/custom_card.dart';

class DraggableScroll extends StatelessWidget {
  const DraggableScroll({
    super.key,
    required this.currentWeather,
    required this.dewpoint,
  });

  final CurrentWeatherModel? currentWeather;
  final double dewpoint;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      maxChildSize: 1,
      minChildSize: 0.35,
      builder: (context, scrollController) {
        return ClipRRect(
          borderRadius: SizeCustomize.borderRadiusCircular(top: 50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.subColor1.withValues(alpha: 0.40),
                    AppColors.subColor2.withValues(alpha: 0.94),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: GridView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 14,
                                  ),
                              children: [
                                CustomizeCard(
                                  icon: Icons.thermostat,
                                  title: "FEELS LIKE",
                                  text: "Similiar to the actual temperature",
                                  value: "${currentWeather?.main.feelsLike}°C",
                                ),
                                CustomizeCard(
                                  icon: Icons.water_rounded,
                                  title: "HUMADITY",
                                  text:
                                      "The dew point is ${dewpoint.toInt()} right now",
                                  value: "${currentWeather?.main.humidity}%",
                                ),
                                CustomizeCard(
                                  icon: Icons.thermostat,
                                  title: "VISIBILTY",
                                  text: "Similiar to the actual temperature",
                                  value:
                                      "${currentWeather?.visibility.convertFromTo(LENGTH.meters, LENGTH.kilometers)} Km",
                                ),
                                CustomizeCard(
                                  icon: Icons.air,
                                  title: "WIND",
                                  text: "Similiar to the actual temperature",
                                  value: "${currentWeather?.wind.speed} m/s",
                                ),
                                CustomizeButton(
                                  function: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                    );
                                  },
                                  widget: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),

                                    child: Row(
                                      children: [
                                        Icon(Icons.logout),
                                        SizedBox(width: 10),
                                        TitleText(text: "Logout", size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IgnorePointer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          height: 7,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

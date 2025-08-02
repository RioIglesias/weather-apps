import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/services/weather/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  bool loading = false;
  bool getData = false;

  WeatherService service = WeatherService();
  CurrentWeatherModel? _result;
  CurrentWeatherModel? get result => _result;

  // Function to get dew point
  double calculateDewPoint(double temperature, int humidity) {
    const a = 17.27;
    const b = 237.7;

    final alpha = ((a * temperature) / (b + temperature)) + log(humidity / 100);
    final dewPoint = (b * alpha) / (a - alpha);

    return dewPoint;
  }

  // Call API weather
  Future<CurrentWeatherModel?> postData() async {
    loading = true;
    notifyListeners();
    Position locationData = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    http.Response response = (await service.getCurrentData(
      lat: locationData.latitude,
      long: locationData.longitude,
    ));
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      _result = CurrentWeatherModel.fromJson(res);
      getData = true;
      notifyListeners();
      return _result;
    }
    loading = false;
    notifyListeners();
    return null;
  }
}

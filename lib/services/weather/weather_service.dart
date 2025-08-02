import 'package:http/http.dart' as http;
import 'package:weather_app/services/base_api.dart';

class WeatherService {
  Future<http.Response> getCurrentData({double? lat, double? long}) async {
    http.Response? response;
    String url = ApiUrl.baseUrl;
    String apiKey = "8fe8f98235a619d878dd20f097cf5835";
    try {
      response = await http.get(
        Uri.parse(
          "$url/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric",
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
}

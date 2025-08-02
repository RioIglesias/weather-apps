import 'package:freezed_annotation/freezed_annotation.dart';
part 'current_weather_model.freezed.dart';
part 'current_weather_model.g.dart';

@freezed
abstract class CurrentWeatherModel with _$CurrentWeatherModel {
  const factory CurrentWeatherModel({
    required Coord coord,
    required List<Weather> weather,
    required String base,
    required Main main,
    required int visibility,
    required Wind wind,
    Rain? rain,
    Snow? snow,
    required Clouds clouds,
    required int dt,
    required Sys sys,
    required int timezone,
    required int id,
    required String name,
    required int cod,
  }) = _CurrentWeatherModel;
  factory CurrentWeatherModel.fromJson(Map<String, Object?> json) =>
      _$CurrentWeatherModelFromJson(json);
}

@freezed
abstract class Clouds with _$Clouds {
  const factory Clouds({required int all}) = _Clouds;
  factory Clouds.fromJson(Map<String, Object?> json) => _$CloudsFromJson(json);
}

@freezed
abstract class Coord with _$Coord {
  const factory Coord({required double lon, required double lat}) = _Coord;
  factory Coord.fromJson(Map<String, Object?> json) => _$CoordFromJson(json);
}

@freezed
abstract class Rain with _$Rain {
  const factory Rain({@JsonKey(name: '1h') required double precipitation}) =
      _Rain;
  factory Rain.fromJson(Map<String, Object?> json) => _$RainFromJson(json);
}

@freezed
abstract class Snow with _$Snow {
  const factory Snow({@JsonKey(name: '1h') required double precipitation}) = _Snow;
  factory Snow.fromJson(Map<String, Object?> json) => _$SnowFromJson(json);
}

@freezed
abstract class Main with _$Main {
  const factory Main({
    required double temp,
    @JsonKey(name: 'feels_like') 
    required double feelsLike,
    @JsonKey(name: 'temp_min') 
    required double tempMin,
    @JsonKey(name: 'temp_max') 
    required double tempMax,
    required int pressure,
    required int humidity,
    @JsonKey(name: 'sea_level') 
    required int seaLevel,
    @JsonKey(name: 'grnd_level') 
    required int grndLevel,
  }) = _Main;
  factory Main.fromJson(Map<String, Object?> json) => _$MainFromJson(json);
}

@freezed
abstract class Sys with _$Sys {
  const factory Sys({
    required String country,
    required int sunrise,
    required int sunset,
  }) = _Sys;
  factory Sys.fromJson(Map<String, Object?> json) => _$SysFromJson(json);
}

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _Weather;
  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);
}

@freezed
abstract class Wind with _$Wind {
  const factory Wind({
    required double speed,
    required int deg,
    required double gust,
  }) = _Wind;
  factory Wind.fromJson(Map<String, Object?> json) => _$WindFromJson(json);
}

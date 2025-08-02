// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'days_weather_model.freezed.dart';
// part 'days_weather_model.g.dart';

// @freezed
// abstract class WeatherModel with _$WeatherModel {
//   const factory WeatherModel({
//     required String cod,
//     required int message,
//     required int cnt,
//     required List<ListElement> list,
//     required City city,
//   }) = _WeatherModel;
//   factory WeatherModel.fromJson(Map<String, Object?> json) =>
//       _$WeatherModelFromJson(json);
// }

// @freezed
// abstract class City with _$City {
//   const factory City({
//     required int id,
//     required String name,
//     required Coord coord,
//     required String country,
//     required int population,
//     required int timezone,
//     required int sunrise,
//     required int sunset,
//   }) = _City;
//   factory City.fromJson(Map<String, Object?> json) => _$CityFromJson(json);
// }

// @freezed
// abstract class Coord with _$Coord {
//   const factory Coord({required double lat, required double lon}) = _Coord;
//   factory Coord.fromJson(Map<String, Object?> json) => _$CoordFromJson(json);
// }

// @freezed
// abstract class ListElement with _$ListElement {
//   const factory ListElement({
//     required int dt,
//     required Main main,
//     required List<Weather> weather,
//     required Clouds clouds,
//     required Wind wind,
//     required int visibility,
//     required double pop,
//     required Sys sys,
//     @JsonKey(name: 'dt_txt')
//     required DateTime dtTxt,
//     required Rain rain,
//   }) = _ListElement;

//   factory ListElement.fromJson(Map<String, Object?> json) =>
//       _$ListElementFromJson(json);
// }

// @freezed
// abstract class Clouds with _$Clouds {
//   const factory Clouds({required int all}) = _Clouds;
//   factory Clouds.fromJson(Map<String, Object?> json) => _$CloudsFromJson(json);
// }

// @freezed
// abstract class Main with _$Main {
//   const factory Main({
//     required double temp,
//     @JsonKey(name: 'feels_like')
//     required double feelsLike,
//     @JsonKey(name: 'temp_min')
//     required double tempMin,
//     @JsonKey(name: 'temp_max')
//     required double tempMax,
//     required int pressure,
//     @JsonKey(name: 'sea_level')
//     required int seaLevel,
//     @JsonKey(name: 'grnd_level')
//     required int grndLevel,
//     required int humidity,
//     @JsonKey(name: 'temp_kf')
//     required double tempKf,
//   }) = _Main;
//   factory Main.fromJson(Map<String, Object?> json) => _$MainFromJson(json);
// }

// @freezed
// abstract class Rain with _$Rain {
//   const factory Rain({@JsonKey(name: '3h') required double rain}) = _Rain;

//   factory Rain.fromJson(Map<String, Object?> json) => _$RainFromJson(json);
// }

// @freezed
// abstract class Sys with _$Sys {
//   const factory Sys({required String pod}) = _Sys;
//   factory Sys.fromJson(Map<String, Object?> json) => _$SysFromJson(json);
// }

// @freezed
// abstract class Weather with _$Weather {
//   const factory Weather({
//     required int id,
//     required String main,
//     required String description,
//     required String icon,
//   }) = _Weather;
//   factory Weather.fromJson(Map<String, Object?> json) =>
//       _$WeatherFromJson(json);
// }

// @freezed
// abstract class Wind with _$Wind {
//   const factory Wind({
//     required double speed,
//     required int deg,
//     required double gust,
//   }) = _Wind;
//   factory Wind.fromJson(Map<String, Object?> json) => _$WindFromJson(json);
// }

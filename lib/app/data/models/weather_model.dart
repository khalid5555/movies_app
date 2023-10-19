/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'package:movies_app/app/core/shared/utils/app_images.dart';

class Condition {
  String? text;
  String? icon;
  int? code;
  Condition({this.text, this.icon, this.code});
  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }
}

class WeatherModel {
  int? lastupdatedepoch;
  String? lastupdated;
  double? tempc;
  double? tempf;
  int? isday;
  Condition? condition;
  double? windmph;
  double? windkph;
  int? winddegree;
  String? winddir;
  double? pressuremb;
  double? pressurein;
  double? precipmm;
  double? precipin;
  int? humidity;
  int? cloud;
  double? feelslikec;
  double? feelslikef;
  double? viskm;
  double? vismiles;
  double? uv;
  double? gustmph;
  double? gustkph;
  WeatherModel(
      {this.lastupdatedepoch,
      this.lastupdated,
      this.tempc,
      this.tempf,
      this.isday,
      this.condition,
      this.windmph,
      this.windkph,
      this.winddegree,
      this.winddir,
      this.pressuremb,
      this.pressurein,
      this.precipmm,
      this.precipin,
      this.humidity,
      this.cloud,
      this.feelslikec,
      this.feelslikef,
      this.viskm,
      this.vismiles,
      this.uv,
      this.gustmph,
      this.gustkph});
  WeatherModel.fromJson(Map<String, dynamic> json) {
    lastupdatedepoch = json['last_updated_epoch'];
    lastupdated = json['last_updated'];
    tempc = json['temp_c'];
    tempf = json['temp_f'];
    isday = json['is_day'];
    condition = json['condition'] != null
        ? Condition?.fromJson(json['condition'])
        : null;
    windmph = json['wind_mph'];
    windkph = json['wind_kph'];
    winddegree = json['wind_degree'];
    winddir = json['wind_dir'];
    pressuremb = json['pressure_mb'];
    pressurein = json['pressure_in'];
    precipmm = json['precip_mm'];
    precipin = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikec = json['feelslike_c'];
    feelslikef = json['feelslike_f'];
    viskm = json['vis_km'];
    vismiles = json['vis_miles'];
    uv = json['uv'];
    gustmph = json['gust_mph'];
    gustkph = json['gust_kph'];
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzid;
  int? localtimeepoch;
  String? localtime;
  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzid,
      this.localtimeepoch,
      this.localtime});
  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzid = json['tz_id'];
    localtimeepoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }
}

class Root {
  Location? location;
  WeatherModel? current;
  Root({this.location, this.current});
  Root.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location?.fromJson(json['location']) : null;
    current = json['current'] != null
        ? WeatherModel?.fromJson(json['current'])
        : null;
  }
}

class Weather {
  final int? max;
  final int? min;
  final int? current;
  final String? name;
  final String? day;
  final int? wind;
  final int? humidity;
  final int? chanceRain;
  final String? image;
  final String? time;
  final String? location;
  Weather(
      {this.max,
      this.min,
      this.name,
      this.day,
      this.wind,
      this.humidity,
      this.chanceRain,
      this.image,
      this.current,
      this.time,
      this.location});
}
List<Weather> todayWeather = [
  Weather(current: 23, image: AppImages.rainy_2d, time: "10:00"),
  Weather(current: 21, image: AppImages.thunder, time: "11:00"),
  Weather(current: 22, image: AppImages.rainy_2d, time: "12:00"),
  Weather(current: 19, image: AppImages.snow_2d, time: "01:00")
];
Weather currentTemp = Weather(
    current: 21,
    image: AppImages.thunder,
    name: "Thunderstorm",
    day: "Monday, 17 May",
    wind: 13,
    humidity: 24,
    chanceRain: 87,
    location: "Minsk");
Weather tomorrowTemp = Weather(
  max: 20,
  min: 17,
  image: AppImages.sunny,
  name: "Sunny",
  wind: 9,
  humidity: 31,
  chanceRain: 20,
);
List<Weather> sevenDay = [
  Weather(
      max: 20, min: 14, image: AppImages.rainy_2d, day: "Mon", name: "Rainy"),
  Weather(
      max: 22, min: 16, image: AppImages.thunder, day: "Tue", name: "Thunder"),
  Weather(
      max: 19, min: 13, image: AppImages.rainy_2d, day: "Wed", name: "Rainy"),
  Weather(max: 18, min: 12, image: AppImages.snow_2d, day: "Thu", name: "Snow"),
  Weather(
      max: 23, min: 19, image: AppImages.sunny_2d, day: "Fri", name: "Sunny"),
  Weather(
      max: 25, min: 17, image: AppImages.rainy_2d, day: "Sat", name: "Rainy"),
  Weather(
      max: 21, min: 18, image: AppImages.thunder, day: "Sun", name: "Thunder")
];
/* 
class Main {
  Main({
    this.location,
    this.current,
  });
  Location? location;
  Current? current;
}
class Current {
  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });
  int? lastUpdatedEpoch;
  String? lastUpdated;
  int? tempC;
  int? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  int? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;
  double? pressureIn;
  int? precipMm;
  int? precipIn;
  int? humidity;
  int? cloud;
  int? feelslikeC;
  int? feelslikeF;
  int? visKm;
  int? visMiles;
  int? uv;
  double? gustMph;
  double? gustKph;
}
class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });
  String? text;
  String? icon;
  int? code;
}
class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;
}
 */
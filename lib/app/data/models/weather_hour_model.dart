/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import '../../core/shared/utils/app_images.dart';

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonphase;
  int? moonillumination;
  int? ismoonup;
  int? issunup;
  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonphase,
      this.moonillumination,
      this.ismoonup,
      this.issunup});
  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonphase = json['moon_phase'];
    moonillumination = json['moon_illumination'];
    ismoonup = json['is_moon_up'];
    issunup = json['is_sun_up'];
  }
}

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

class Current {
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
  Current(
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
  Current.fromJson(Map<String, dynamic> json) {
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

class Day {
  double? maxtempc;
  double? maxtempf;
  double? mintempc;
  double? mintempf;
  double? avgtempc;
  double? avgtempf;
  double? maxwindmph;
  double? maxwindkph;
  double? totalprecipmm;
  double? totalprecipin;
  double? totalsnowcm;
  double? avgviskm;
  double? avgvismiles;
  double? avghumidity;
  int? dailywillitrain;
  int? dailychanceofrain;
  int? dailywillitsnow;
  int? dailychanceofsnow;
  Condition? condition;
  double? uv;
  Day(
      {this.maxtempc,
      this.maxtempf,
      this.mintempc,
      this.mintempf,
      this.avgtempc,
      this.avgtempf,
      this.maxwindmph,
      this.maxwindkph,
      this.totalprecipmm,
      this.totalprecipin,
      this.totalsnowcm,
      this.avgviskm,
      this.avgvismiles,
      this.avghumidity,
      this.dailywillitrain,
      this.dailychanceofrain,
      this.dailywillitsnow,
      this.dailychanceofsnow,
      this.condition,
      this.uv});
  Day.fromJson(Map<String, dynamic> json) {
    maxtempc = json['maxtemp_c'];
    maxtempf = json['maxtemp_f'];
    mintempc = json['mintemp_c'];
    mintempf = json['mintemp_f'];
    avgtempc = json['avgtemp_c'];
    avgtempf = json['avgtemp_f'];
    maxwindmph = json['maxwind_mph'];
    maxwindkph = json['maxwind_kph'];
    totalprecipmm = json['totalprecip_mm'];
    totalprecipin = json['totalprecip_in'];
    totalsnowcm = json['totalsnow_cm'];
    avgviskm = json['avgvis_km'];
    avgvismiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailywillitrain = json['daily_will_it_rain'];
    dailychanceofrain = json['daily_chance_of_rain'];
    dailywillitsnow = json['daily_will_it_snow'];
    dailychanceofsnow = json['daily_chance_of_snow'];
    condition = json['condition'] != null
        ? Condition?.fromJson(json['condition'])
        : null;
    uv = json['uv'];
  }
}

class Forecast {
  List<Forecastday?>? forecastday;
  Forecast({this.forecastday});
  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }
}

class Forecastday {
  String? date;
  int? dateepoch;
  Day? day;
  Astro? astro;
  List<Hour?>? hour;
  Forecastday({this.date, this.dateepoch, this.day, this.astro, this.hour});
  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateepoch = json['date_epoch'];
    day = json['day'] != null ? Day?.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro?.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }
}

class Hour {
  int? timeepoch;
  String? time;
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
  double? windchillc;
  double? windchillf;
  double? heatindexc;
  double? heatindexf;
  double? dewpointc;
  double? dewpointf;
  int? willitrain;
  int? chanceofrain;
  int? willitsnow;
  int? chanceofsnow;
  double? viskm;
  double? vismiles;
  double? gustmph;
  double? gustkph;
  double? uv;
  Hour(
      {this.timeepoch,
      this.time,
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
      this.windchillc,
      this.windchillf,
      this.heatindexc,
      this.heatindexf,
      this.dewpointc,
      this.dewpointf,
      this.willitrain,
      this.chanceofrain,
      this.willitsnow,
      this.chanceofsnow,
      this.viskm,
      this.vismiles,
      this.gustmph,
      this.gustkph,
      this.uv});
  Hour.fromJson(Map<String, dynamic> json) {
    timeepoch = json['time_epoch'];
    time = json['time'];
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
    windchillc = json['windchill_c'];
    windchillf = json['windchill_f'];
    heatindexc = json['heatindex_c'];
    heatindexf = json['heatindex_f'];
    dewpointc = json['dewpoint_c'];
    dewpointf = json['dewpoint_f'];
    willitrain = json['will_it_rain'];
    chanceofrain = json['chance_of_rain'];
    willitsnow = json['will_it_snow'];
    chanceofsnow = json['chance_of_snow'];
    viskm = json['vis_km'];
    vismiles = json['vis_miles'];
    gustmph = json['gust_mph'];
    gustkph = json['gust_kph'];
    uv = json['uv'];
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
  Current? current;
  Forecast? forecast;
  Root({this.location, this.current, this.forecast});
  Root.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location?.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current?.fromJson(json['current']) : null;
    forecast =
        json['forecast'] != null ? Forecast?.fromJson(json['forecast']) : null;
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

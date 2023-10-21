import 'dart:convert';

import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/data/models/weather_hour_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// http://api.weatherapi.com/v1/current.json?key=079a0aa530ec40e9ad7221101231710&q=assuit
// http://api.weatherapi.com/v1/forecast.json?key=079a0aa530ec40e9ad7221101231710&q=27.44,30.81&days=7
class WeatherController extends GetxController {
  static var base = "http://api.weatherapi.com/v1";
  static var api_key =
      "079a0aa530ec40e9ad7221101231710"; // Your API key to themoviedb.org is
  var weatherList = <Current>[].obs;
  var locationList = <Location>[].obs;
  var forecastList = <Forecast>[].obs;
  var hourList = <Hour>[].obs;
  var query = ''.obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    getWeather();
    super.onInit();
  }

  Future getWeather() async {
    var baseWeather =
        "$base/forecast.json?lang=ar&key=$api_key&q=27.44,30.82&days=7";
    weatherList = <Current>[].obs;
    locationList = <Location>[].obs;
    forecastList = <Forecast>[].obs;
    hourList = <Hour>[].obs;
    try {
      isLoading.value = true;
      printInfo(info: " {page=> of weather}");
      Uri uri = Uri.parse(baseWeather);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = json.decode(utf8.decode(response.bodyBytes));
        var current = jsonData['current'];
        var location = jsonData['location'];
        var forecast = jsonData['forecast'];
        var forecast2 = jsonData['forecast']['forecastday'][0]['hour'] as List;
        // var movies = jsonData['d'] as List;
        // var articles = jsonData['items'] as List;
        printInfo(info: " before ${weatherList.length}");
        weatherList.add(Current.fromJson(current));
        locationList.add(Location.fromJson(location));
        forecastList.add(Forecast.fromJson(forecast));
        hourList.assignAll(forecast2.map((e) => Hour.fromJson(e)).toList());
        update();
        printInfo(info: " after ${weatherList.length}");
        // printInfo(
        //     info:
        //         " hour next ${forecastList.first.forecastday![0]!.hour!.first!.time}");
        printInfo(info: " hour next ${locationList[0].localtime!}");
        printInfo(
            info: " day next ${forecastList.first.forecastday![2]!.date}");
        //today weather
        printInfo(info: " after ${locationList.first.name}");
        methodName();
        isLoading.value = false;
        update();
      } else {
        printInfo(
            info:
                'API call returned: ${response.statusCode} ${response.reasonPhrase}');
        Get.snackbar('error', response.reasonPhrase!,
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        isLoading.value = false;
        update();
      }
    } catch (e) {
      printError(info: ' catch  $e');
      Get.snackbar('error', e.toString().toLowerCase());
      isLoading.value = false;
      update();
    }
  }

  var formattedTime = ''.obs;
  // final url = 'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$latitude,$longitude&days=7';
  var cityJSON;
  Future<CityModel?> fetchCity(String cityName) async {
    if (cityJSON == null) {
      String link =
          "https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/cities.json";
      var response = await http.get(Uri.parse(link));
      if (response.statusCode == 200) {
        cityJSON = json.decode(response.body);
      }
    }
    for (var i = 0; i < cityJSON.length; i++) {
      if (cityJSON[i]["name"].toString().toLowerCase() ==
          cityName.toLowerCase()) {
        return CityModel(
            name: cityJSON[i]["name"].toString(),
            lat: cityJSON[i]["latitude"].toString(),
            lon: cityJSON[i]["longitude"].toString());
      }
    }
    return null;
  }

  void methodName() {
    // printInfo(info: 'ddddddddddddd ${weatherList[0].lastupdated}');
    // String timeStr = hour.localtime!;
    String timeStr = "${weatherList.first.lastupdated}";
    // String timeStr = "${locationList.first.localtime}";
    DateTime time = DateTime.parse(timeStr);
    if (time.hour > 12) {
      formattedTime.value =
          '${time.hour - 12}:${time.minute.toString().padLeft(1, '0')} م';
    } else if (time.hour == 0) {
      formattedTime.value =
          '${time.hour + 12}:${time.minute.toString().padLeft(1, '0')} ص';
    } else if (time.hour == 12) {
      formattedTime.value =
          '${time.hour}:${time.minute.toString().padLeft(1, '0')} م';
    } else {
      formattedTime.value =
          '${time.hour}:${time.minute.toString().padLeft(1, '0')} ص';
    }
    update();
  }
}

class CityModel {
  final String? name;
  final String? lat;
  final String? lon;
  CityModel({this.name, this.lat, this.lon});
}

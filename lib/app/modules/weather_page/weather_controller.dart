import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/app/core/shared/utils/app_colors.dart';
import 'package:movies_app/app/data/models/weather_model.dart';

// http://api.weatherapi.com/v1/current.json?key=079a0aa530ec40e9ad7221101231710&q=assuit
class WeatherController extends GetxController {
  static var base = "http://api.weatherapi.com/v1";
  static var api_key =
      "079a0aa530ec40e9ad7221101231710"; // Your API key to themoviedb.org is
  var weatherList = <WeatherModel>[].obs;
  var locationList = <Location>[].obs;
  var query = ''.obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getWeather();
  }

  Future getWeather() async {
    var baseWeather = "$base/current.json?key=$api_key&q=assiut";
    weatherList = <WeatherModel>[].obs;
    locationList = <Location>[].obs;
    try {
      isLoading.value = true;
      printInfo(info: " {page=> of weather}");
      Uri uri = Uri.parse(baseWeather);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        var current = jsonData['current'];
        var location = jsonData['location'];
        // var movies = jsonData['d'] as List;
        // var articles = jsonData['items'] as List;
        printInfo(info: " before ${weatherList.length}");
        weatherList.add(WeatherModel.fromJson(current));
        locationList.add(Location.fromJson(location));
       
        printInfo(info: " after ${weatherList.length}");
        printInfo(info: " after ${locationList.first.name}");
        isLoading.value = false;
        update();
      } else {
        printInfo(
            info:
                'API call returned: ${response.statusCode} ${response.reasonPhrase}');
        Get.snackbar('error', response.reasonPhrase!,
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        isLoading.value = false;
      }
    } catch (e) {
      printError(info: ' catch  $e');
      Get.snackbar('error', e.toString());
      isLoading.value = false;
    }
  }
}

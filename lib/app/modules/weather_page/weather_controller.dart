import 'dart:convert';

import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/core/shared/widgets/app_text.dart';
import 'package:NewsMovie/app/data/models/weather_hour_model.dart';
import 'package:NewsMovie/app/data/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../data/services/api_services.dart';

// api.openweathermap.org/data/2.5/weather?q=القوصية&appid=94f4f16453b03123ad097f19bf47f829&lang=ar
// https://api.openweathermap.org/data/2.5/weather?q=القوصية&appid=94f4f16453b03123ad097f19bf47f829&lang=ar
// api.openweathermap.org/data/2.5/forecast?q=القوصية&appid=94f4f16453b03123ad097f19bf47f829&lang=ar
// http://api.weatherapi.com/v1/forecast.json?key=079a0aa530ec40e9ad7221101231710&q=27.44,30.81&days=7
class WeatherController extends GetxController {
  var weatherData = <String, dynamic>{};
  GetStorage box = GetStorage();
  WeatherService? weatherService;
  static var base = "http://api.weatherapi.com/v1";
  static var api_key =
      "079a0aa530ec40e9ad7221101231710"; // Your API key to themoviedb.org is
  var cityList = <City>[].obs;
  var listaList = <Lista>[].obs;
  // var weatherList = <Weather>[].obs;
  // var mainList = <Main>[].obs;
  // List<Map> weatherList = [];
  // List<Map> mainList = [];
  List<Map> allList = [];
  var currentList = <Current>[].obs;
  var locationList = <Location>[].obs;
  var forecastList = <Forecast>[].obs;
  var forecastDayList = <Forecastday>[].obs;
  var hourList = <Hour>[].obs;
  var isLoading = false.obs;
  var formattedTime = ''.obs;
  // late var query;
  @override
  void onInit() {
    // getWeather(box.read("city") ?? 'القوصية');
    getWeatherFromOpenWeather(box.read("city2") ?? 'القوصية');
    // currentFromOpenWeather(box.read("city2") ?? 'القوصية');
    // search2();
    // fetchData(box.read("city") ?? '');
    super.onInit();
  }

  List<dynamic> searchResults = [];
  bool entryExists = false;
  search2() async {
    late var entryValue;
    // box.remove("city");
    var city = box.read("city");
    debugPrint('city111: $city');
    entryValue = city ?? "";
    // entryValue.value = box.read('city');
    printInfo(info: " entryExists11111111 $searchResults");
    if (city == "" || city == null) {
      entryValue = 'cairo';
      debugPrint('entryValue: $entryValue');
      // box.write("city", entryValue.value);
      debugPrint(' box.write("city", entryValue.value);: ${box.read("city")}');
    }
    // getWeather(entryValue.value);
    // entryValue = box.read('city');
    String url = "$base/search.json?key=$api_key&q=$entryValue";
    final response = await getWeatherData(url);
// Check if the response is successful
    if (response.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      searchResults = jsonData;
      entryExists = searchResults.any((result) => result['name'] == entryValue);
      // query = entryValue;
      // getWeather(entryValue!);
      if (entryExists) {
        box.write("city", entryValue);
        await getWeather(entryValue);
        update();
      } else {
        box.remove("city");
        await getWeather(entryValue);
        // Get.snackbar('Hi', 'i am a modern snackbar');
        update();
      }
      // await getWeather(entryValue.value);
      printInfo(info: " searchResults $searchResults");
      printInfo(info: " entryValue $entryValue");
      // Update the UI with the new data
      update();
    } else {
      // Handle the error
      print('Error: ${response.statusCode}');
    }
  }

/*   search() async {
   String boxStorage = box.read('city');
    printInfo(info: ' in search  ${box.read('city')}');
    if (boxStorage== weatherData.value["name"]) {
      query = box.read('city');
    } else if (box.read('city') != weatherData.value["name"]) {
      query = 'asyut';
    } else if (box.read('city') == null) {
      query = 'assuit';
    } else if (box.read('city') == '') {
      query = 'cairo';
    } else {
      query = box.read('city');
    }
    /* printInfo(info: ' in search  ${box.read('city')}');
    if (box.read('city') == weatherData.value["name"]) {
      query = box.read('city');
      // box.remove('city');
    } else if (box.read('city') != weatherData.value["name"]) {
      query = 'cairo';
      // box.write('city', query);
    } else if (box.read('city') == null) {
      query = 'assuit';
      // box.write('city', query);
    } else if (box.read('city') == '') {
      query = 'cairo';
      // box.write('city', query);
    } else {
      query = box.read('city');
      // box.write('city', query);
    } */
  } */
  Future<void> getWeather(String? query) async {
    printInfo(info: " query = box.read('city') $query");
    query = box.read('city') ?? 'القوصية';
    try {
      isLoading.value = true;
      // search2();
      // https://api.openweathermap.org/data/2.5/weather?q=القوصية&appid=94f4f16453b03123ad097f19bf47f829&lang=ar
      // api.openweathermap.org/data/2.5/forecast?q=asyut&appid=94f4f16453b03123ad097f19bf47f829&lang=ar
      final baseWeather =
          "$base/forecast.json?lang=ar&key=$api_key&q=$query&days=7";
      initializeLists();
      printInfo(info: " {page=> of weather}");
      final response = await getWeatherData(baseWeather);
      await getWeatherFromOpenWeather(query);
      if (response.statusCode == 200) {
        processResponseData(response);
      } else {
        Get.defaultDialog(
            title: '🚨 أنتبه',
            contentPadding: const EdgeInsets.all(10),
            content: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  App_Text(maxLine: 3, data: "🫡🤔  حاول مرة اخرى"),
                  SizedBox(height: 7),
                  App_Text(maxLine: 3, data: "❌ الاسم الذي ادخلتة غير موجود "),
                ],
              ),
            ));
        handleErrorResponse(response);
        await search2();
      }
    } catch (e) {
      handleException(e);
      // isLoading.value = false;
    }
  }

  Future<void> getWeatherFromOpenWeather(String? query2) async {
    printInfo(info: " query2 = box.read('city2') $query2");
    query2 = box.read('city2') ?? 'القوصية';
    try {
      cityList = <City>[].obs;
      isLoading.value = true;
      final baseWeather =
          "https://api.openweathermap.org/data/2.5/forecast?q=$query2&appid=94f4f16453b03123ad097f19bf47f829&lang=ar";
      printInfo(info: " {page=> of open weather}");
      final response = await getWeatherData(baseWeather);
      if (response.statusCode == 200) {
        final jsonData = json.decode(utf8.decode(response.bodyBytes));
        await currentFromOpenWeather(query2);
        if (jsonData['city']['name'] != query2) {
          box.write("city2", 'القوصية');
          query2 = 'القوصية';
          Get.defaultDialog(
              title: '🚨 أنتبه',
              contentPadding: const EdgeInsets.all(10),
              content: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    App_Text(maxLine: 3, data: "🫡🤔  حاول مرة اخرى"),
                    SizedBox(height: 7),
                    App_Text(
                        maxLine: 3, data: "❌ الاسم الذي ادخلتة غير موجود "),
                  ],
                ),
              ));
          await getWeatherFromOpenWeather(query2);
          await currentFromOpenWeather(query2);
          // currentFromOpenWeather(query2);
        } else {
          cityList.add(City.fromJson(jsonData['city']));
          listaList.assignAll((jsonData['list'] as List)
              .map((e) => Lista.fromJson(e))
              .toList());
          await currentFromOpenWeather(query2);
          // currentFromOpenWeather(query2);
          printInfo(info: " afteropenweathermap ${listaList.first.dttxt}");
          printInfo(info: " city list ${cityList.first.name}");
          // changeDateTime();
          isLoading.value = false;
          update();
        }
      } else {
        Get.defaultDialog(
            title: '🚨 أنتبه',
            contentPadding: const EdgeInsets.all(10),
            content: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  App_Text(maxLine: 3, data: "🫡🤔  حاول مرة اخرى"),
                  SizedBox(height: 7),
                  App_Text(maxLine: 3, data: "❌ الاسم الذي ادخلتة غير موجود "),
                ],
              ),
            ));
        box.write("city2", 'القوصية');
        await getWeatherFromOpenWeather(query2);
        await currentFromOpenWeather(query2);
        handleErrorResponse(response);
        // await search2();
      }
    } catch (e) {
      printInfo(info: " errrrrrrrrrrrrr $e");
      // handleException(e);
      // isLoading.value = false;
      // update();
    }
  }

  Future<void> currentFromOpenWeather(String? query2) async {
    printInfo(info: " query3 = box.read('city3') $query2");
    query2 = box.read('city2') ?? 'القوصية';
    try {
      isLoading.value = true;
      allList = [];
      final baseWeather =
          "https://api.openweathermap.org/data/2.5/weather?q=$query2&appid=94f4f16453b03123ad097f19bf47f829&lang=ar";
      printInfo(info: " {page=> of open weather22222}");
      // cityList = <City>[].obs;
      // weatherList = <Weather>[].obs;
      // mainList = <Main>[].obs;
      final response = await getWeatherData(baseWeather);
      if (response.statusCode == 200) {
        final jsonData = json.decode(utf8.decode(response.bodyBytes));
        allList.add(jsonData);
        // weatherList.assignAll((jsonData['weather'] as List)
        //     .map((e) => Weather.fromJson(e))
        //     .toList());
        // await getWeatherFromOpenWeather(query2);
        // weatherList.add(Weather.fromJson(jsonData['weather']));
        // mainList.add(Main.fromJson(jsonData['main']));
        debugPrint('allList: ${allList.first['dt']}');
        isLoading.value = false;
        update();
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException(e);
      // isLoading.value = false;
      // update();
    }
  }

  void initializeLists() {
    currentList = <Current>[].obs;
    locationList = <Location>[].obs;
    forecastList = <Forecast>[].obs;
    forecastDayList = <Forecastday>[].obs;
    hourList = <Hour>[].obs;
  }

  Future<http.Response> getWeatherData(String baseWeather) async {
    Uri uri = Uri.parse(baseWeather);
    return await http.get(uri);
  }

  void processResponseData(http.Response response) {
    final jsonData = json.decode(utf8.decode(response.bodyBytes));
    // weatherData.value = jsonData['location'];
    currentList.add(Current.fromJson(jsonData['current']));
    locationList.add(Location.fromJson(jsonData['location']));
    forecastList.add(Forecast.fromJson(jsonData['forecast']));
    forecastDayList.assignAll((jsonData['forecast']['forecastday'] as List)
        .map((e) => Forecastday.fromJson(e))
        .toList());
    hourList.assignAll((jsonData['forecast']['forecastday'][0]['hour'] as List)
        .map((e) => Hour.fromJson(e))
        .toList());
    update();
    printWeatherData();
    changeDateTime();
    isLoading.value = false;
    update();
  }

  void printWeatherData() {
    printInfo(info: " before ${currentList.length}");
    // for (var i = 0; i < forecastDayList.length; i++) {
    //   printInfo(info: " weather from loop ${forecastDayList[i].date!}");
    // }
    // printInfo(
    //     info: " weather weather from ${forecastDayList[1].day!.maxtempc}");
    printInfo(info: " after ${currentList.length}");
    printInfo(info: " afterrrrrrr ${locationList.first.name}");
  }

  void handleErrorResponse(http.Response response) {
    printInfo(
        info:
            'API call returned: ${response.statusCode} ${response.reasonPhrase}');
    Get.snackbar('error', ('Failed to search this city ${response.statusCode}'),
        backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
    isLoading.value = false;
    update();
  }

  void handleException(e) {
    printError(info: ' catch error  $e');
    Get.snackbar('error', 'Failed to connect to the API or internet',
        backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
    isLoading.value = false;
    update();
  }

  void changeDateTime() {
    String timeStr = "${currentList.first.lastupdated}";
    DateTime time = DateTime.parse(timeStr);
    if (time.hour > 12) {
      formattedTime.value =
          '${time.hour - 12}:${time.minute.toString().padLeft(0, '0')} م';
    } else if (time.hour == 0) {
      formattedTime.value =
          '${time.hour + 12}:${time.minute.toString().padLeft(0, '0')} ص';
    } else if (time.hour == 12) {
      formattedTime.value =
          '${time.hour}:${time.minute.toString().padLeft(0, '0')} م';
    } else {
      formattedTime.value =
          '${time.hour}:${time.minute.toString().padLeft(0, '0')} ص';
    }
    update();
  }
/*   Future<void> getWeather() async {
    try {
      await search();
      var baseWeather =
          "$base/forecast.json?lang=ar&key=$api_key&q=$query&days=7";
      weatherList = <Current>[].obs;
      locationList = <Location>[].obs;
      forecastList = <Forecast>[].obs;
      hourList = <Hour>[].obs;
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
        weatherData.value = location;
        printInfo(info: " before ${weatherList.length}");
        weatherList.add(Current.fromJson(current));
        locationList.add(Location.fromJson(location));
        forecastList.add(Forecast.fromJson(forecast));
        hourList.assignAll(forecast2.map((e) => Hour.fromJson(e)).toList());
        update();
        printInfo(info: " weather bbbbb ${weatherData.value["name"]}");
        printInfo(info: " after ${weatherList.length}");
        printInfo(info: " weather ${weatherData.value}");
        // printInfo(
        //     info:
        //         " hour next ${forecastList.first.forecastday![0]!.hour!.first!.time}");
        // printInfo(info: " hour next ${locationList[0].localtime!}");
        // printInfo(
        //     info: " day next ${forecastList.first.forecastday![2]!.date}");
        //today weather
        printInfo(info: " afterrrrrrr ${locationList.first.name}");
        changeDateTime();
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
  } */
  /* Future fetchData(String city) async {
    // locationList = <Location>[].obs;
    try {
      isLoading.value = true;
      printInfo(info: " {page=> of weather}");
      var data = await weatherService!.getWeather(city);
      weatherData.value = data;
      box.write("city", city);
      locationList.add(Location.fromJson(data));
      update();
      printInfo(info: " city $city");
      // printInfo(info: " after ${locationList.first.name}");
      changeDateTime();
      isLoading.value = false;
      update();
    } catch (e) {
      printError(info: ' catch  $e');
      Get.snackbar('error', e.toString().toLowerCase());
      isLoading.value = false;
      update();
    }
  } */
}

enum WeatherEndpoint {
  weather,
  forecast,
}

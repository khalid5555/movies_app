import 'dart:convert';
import 'package:http/http.dart' as http;
class WeatherService {

Future<Map<String, dynamic>> fetchWeatherData(String cityName) async {
  final apiKey =  "079a0aa530ec40e9ad7221101231710";
  final apiUrl = 'https://api.weatherapi.com/v1/search.json?key=$apiKey&q=$cityName';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}


  Future<Map<String, dynamic>> getWeather(String city) async {
    // http://api.weatherapi.com/v1/forecast.json?lang=ar&key=079a0aa530ec40e9ad7221101231710&q=asyut&days=7
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?lang=ar&key=079a0aa530ec40e9ad7221101231710&q=$city&days=7'));
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
/* 
class APIService {
  /*
  // API key
  // Base API url
  // final String _baseUrl = "https://movie-database-alternative.p.rapidapi.com";
  final String _baseUrl =
      'https://imdb8.p.rapidapi.com/title/v2/find?title=search%20&limit=20&sortArg=moviemeter%2Casc';
  // static const String _baseUrl =
  //     "https://movie-database-alternative.p.rapidapi.com";
  // Base headers for Response url
  static const Map<String, String> _headers = {
    // "x-rapidapi-key": "f7eafcd7a5mshd60d54fd4d3c81dp1f8352jsnce465d5b2b32",
    // "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com",
    'X-RapidAPI-Key': 'f7eafcd7a5mshd60d54fd4d3c81dp1f8352jsnce465d5b2b32',
    'X-RapidAPI-Host': 'imdb8.p.rapidapi.com'
  };
  // Base API request to get response
   Future<void> getMovies() async {
    try {
      Uri uri = Uri.parse(_baseUrl);
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        print("success");
        printInfo(info: response.body.toString());
        return json.decode(response.body);
      } else {
        print("not success");
        throw Exception('Failed to load json data');
      }
    } catch (e) {
      printError(info: e.toString());
    }
  } */
}
 */
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class APIService {
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
  }
}

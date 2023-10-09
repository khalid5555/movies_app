import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/app/data/models/movies_model.dart';
class MoviePageController extends GetxController {
  var moviesList = <DMoviesModel>[].obs;
  // List<TestMovie> moviesList = <TestMovie>[].obs;
  var search = ''.obs;
  var isLoading = false.obs;
  static const Map<String, String> _headers = {
    'X-RapidAPI-Key': 'f7eafcd7a5mshd60d54fd4d3c81dp1f8352jsnce465d5b2b32',
    // "x-rapidapi-key": "f278013c42cb402f8ba30770a2cc67cf",
    // "x-rapidapi-host": "sameer-kumar-aztro-v1.p.rapidapi.com",
    'X-RapidAPI-Host': 'imdb8.p.rapidapi.com'
  };
  // Base API request to get response
  @override
  void onInit() {
    getMovies();
    super.onInit();
  }
  Future getMovies() async {
    try {
      isLoading.value = true;
      Uri uri = Uri.parse('https://imdb8.p.rapidapi.com/auto-complete?q=mam');
      // Uri uri = Uri.parse('https://imdb8.p.rapidapi.com/auto-complete?q=game');
      // Uri uri = Uri.parse(
      //     'https://imdb8.p.rapidapi.com/actors/get-all-news?nconst=nm0001667');
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        final jsonData = json.decode(response.body);
        var movies = jsonData['d'] as List;
        // var articles = jsonData['items'] as List;
        printInfo(info: " before ${moviesList.length}");
        moviesList
            .assignAll(movies.map((e) => DMoviesModel.fromJson(e)).toList());
        printInfo(info: " after ${moviesList.length}");
        isLoading.value = false;
      } else {
        // If that response was not OK, throw an error.
        printInfo(
            info:
                'API call returned: ${response.statusCode} ${response.reasonPhrase}');
        isLoading.value = false;
      }
    } catch (e) {
      printInfo(info: e.toString());
      isLoading.value = false;
    }
  }
  /* 
  Future getMoviesBy({String? tags}) async {
    try {
      Uri uri = Uri.parse('https://imdb8.p.rapidapi.com/auto-complete?q=$tags');
      // Uri uri = Uri.parse('https://imdb8.p.rapidapi.com/auto-complete?q=game');
      // Uri uri = Uri.parse(
      //     'https://imdb8.p.rapidapi.com/actors/get-all-news?nconst=nm0001667');
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        final jsonData = json.decode(response.body);
        var articles = jsonData['d'] as List;
        // var articles = jsonData['items'] as List;
        printInfo(info: " before ${moviesList.length}");
        moviesList
            .assignAll(articles.map((e) => DMoviesModel.fromJson(e)).toList());
        printInfo(info: " after ${moviesList.length}");
      } else {
        // If that response was not OK, throw an error.
        printInfo(
            info:
                'API call returned: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {}
    printInfo(info: e.toString());
  } */
}

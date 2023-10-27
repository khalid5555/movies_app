import 'dart:convert';

import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/data/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MoviePageController extends GetxController {
  static var base = "https://api.themoviedb.org/3";
  static var api_key =
      "805d482bbe9f774e4c8231aeb0c303a2"; // Your API key to themoviedb.org is
  var moviesList = <FinalMoviesModel>[].obs;
  var seriesList = <SeriesModel>[].obs;
  var searchList = <SearchModel>[].obs;
  var currentPageSearch = 1.obs;
  var currentPageMovies = 1.obs;
  var currentPageSeries = 1.obs;
  var query = ''.obs;
  var isLoading = false.obs;
  final focusNode = FocusNode();
  final RxList<String> category = [
    "upcoming",
    "now_playing",
    "discover",
    "popular",
    "top_rated",
    "person/popular",
    "trending/all/day",
    "trending/movie/day"
  ].obs;
  var indexCategory = 0.obs;
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  // static const Map<String, String> _headers = {
  //   'X-RapidAPI-Key': 'f7eafcd7a5mshd60d54fd4d3c81dp1f8352jsnce465d5b2b32',
  //   // "x-rapidapi-key": "f278013c42cb402f8ba30770a2cc67cf",
  //   // "x-rapidapi-host": "sameer-kumar-aztro-v1.p.rapidapi.com",
  //   'X-RapidAPI-Host': 'imdb8.p.rapidapi.com'
  // };
  // static var baseUrl =
  //     "https://api.themoviedb.org/3/movie//popular?api_key=805d482bbe9f774e4c8231aeb0c303a2";
  // static var searchUrl =
  //     "$base/search/multi?query=batman&page=1&api_key=$api_key";
  static const Map<String, String> _headers = {
    "accept": "application/json",
    "Authorization": "Bearer 805d482bbe9f774e4c8231aeb0c303a2"
  };
  @override
  void onInit() {
    getMovies();
    getSeries();
    getMoviesBy();
    super.onInit();
  }

  Future getMovies() async {
    //&language=ar-Eg
    // var baseMovies =
    //     "$base/discover/movie?page=${currentPageMovies.value}&api_key=$api_key";
    var baseMovies =
        "$base/movie/upcoming?page=${currentPageMovies.value}&api_key=$api_key";
    try {
      // Uri uri = Uri.parse('https://imdb8.p.rapidapi.com/auto-complete?q=game');
      isLoading.value = true;
      printInfo(info: " {page=> of movies ${currentPageMovies.value}");
      Uri uri = Uri.parse(baseMovies);
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        final jsonData = json.decode(response.body);
        var movies = jsonData['results'] as List;
        // var movies = jsonData['d'] as List;
        // var articles = jsonData['items'] as List;
        printInfo(info: " before ${moviesList.length}");
        moviesList.assignAll(
            movies.map((e) => FinalMoviesModel.fromJson(e)).toList());
        printInfo(info: " after ${moviesList.length}");
        isLoading.value = false;
        update();
      } else {
        printInfo(
            info:
                'API call returned: ${response.statusCode} ${response.reasonPhrase}');
        Get.snackbar('error', response.reasonPhrase!,
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        Get.snackbar('error',
            ('Failed to connect to the API or internet${response.statusCode}'),
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        isLoading.value = false;
      }
    } catch (e) {
      printError(info: ' catch  $e');
      Get.snackbar('error', ('Failed to connect to the API or internet'),
          backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
      isLoading.value = false;
    }
  }

  Future getMoviesByCategory() async {
    //&language=ar-Eg
    // https://api.themoviedb.org/3/movie/upcoming?language=en-US&api_key=805d482bbe9f774e4c8231aeb0c303a2
    var baseMovies =
        "$base/movie/upcoming?page=${currentPageMovies.value}&api_key=$api_key";
    try {
      // Uri uri = Uri.parse('https://imdb8.p.rapidapi.com/auto-complete?q=game');
      isLoading.value = true;
      printInfo(info: " {page=> of movies ${currentPageMovies.value}");
      Uri uri = Uri.parse(baseMovies);
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        final jsonData = json.decode(response.body);
        var movies = jsonData['results'] as List;
        // var movies = jsonData['d'] as List;
        // var articles = jsonData['items'] as List;
        printInfo(info: " before ${moviesList.length}");
        moviesList.assignAll(
            movies.map((e) => FinalMoviesModel.fromJson(e)).toList());
        printInfo(info: " after ${moviesList.length}");
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

  Future getSeries() async {
    var baseSeries =
        "$base/tv/top_rated?page=${currentPageSeries.value}&api_key=$api_key";
    try {
      isLoading.value = true;
      printInfo(info: " {page=> of series ${currentPageSeries.value}");
      Uri uri = Uri.parse(baseSeries);
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        final jsonData = json.decode(response.body);
        var movies = jsonData['results'] as List;
        printInfo(info: " before seriesList ${seriesList.length}");
        seriesList
            .assignAll(movies.map((e) => SeriesModel.fromJson(e)).toList());
        printInfo(info: " after seriesList ${seriesList.length}");
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
    }
  }

  Future getMoviesBy() async {
    var searchUrl =
        "$base/search/multi?query=${query.value}&page=${currentPageSearch.value}&api_key=$api_key";
    try {
      isLoading.value = true;
      printInfo(info: " {page=> of search ${currentPageSearch.value}");
      Uri uri = Uri.parse(searchUrl);
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        final jsonData = json.decode(response.body);
        var articles = jsonData['results'] as List;
        // var articles = jsonData['items'] as List;
        printInfo(info: " before search ${searchList.length}");
        searchList
            .assignAll(articles.map((e) => SearchModel.fromJson(e)).toList());
        isLoading.value = false;
        update();
        printInfo(info: " after search ${searchList.length}");
      } else {
        // If that response was not OK, throw an error.
        printInfo(
            info:
                'API call returned: ${response.statusCode} ${response.reasonPhrase}');
        Get.snackbar('error', response.reasonPhrase!,
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        isLoading.value = false;
      }
    } catch (e) {
      printInfo(info: e.toString());
      Get.snackbar('error', e.toString());
    }
  }

  void changePageSeries() {
    if (currentPageSeries.value < seriesList.length) {
      currentPageSeries.value++;
      getSeries();
      printInfo(info: " {yes from series} ${currentPageSeries.value}");
      update();
    } else {
      printInfo(info: " {nooooooooo} ${currentPageSeries.value}");
      update();
    }
  }

  void changePageMovie() {
    if (currentPageMovies.value < moviesList.length) {
      currentPageMovies.value++;
      getMovies();
      printInfo(info: " {yes from movies} ${currentPageMovies.value}");
      update();
    } else {
      printInfo(info: " {nooooooooo} ${currentPageMovies.value}");
      update();
    }
  }

  void changePageSearch() {
    if (currentPageSearch.value < searchList.length) {
      currentPageSearch.value++;
      getMoviesBy();
      printInfo(info: " {yes from search} ${currentPageSearch.value}");
      update();
    } else {
      printInfo(info: " {nooooooooo} ${currentPageSearch.value}");
      update();
    }
  }
}
/*   Future<void> searchMovies(String query, int page) async {
    final searchUrl =
        '$base/search/movie?api_key=$api_key&query=$query&page=$page';
    try {
      final response = await http.get(Uri.parse(searchUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final results = jsonData['results'] as List<dynamic>;
        if (page == 1) {
          searchList.value =
              results.map((result) => SearchModel.fromJson(result)).toList();
        } else {
          searchList.assignAll(
              results.map((result) => SearchModel.fromJson(result)).toList());
        }
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      throw Exception('Failed to connect to the API');
    }
  } */
  /* Future getMoviesBy({String? tags}) async {
    try {
      Uri uri = Uri.parse(searchUrl);
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        final jsonData = json.decode(response.body);
        var articles = jsonData['results'] as List;
        // var articles = jsonData['items'] as List;
        printInfo(info: " before ${searchList.length}");
        searchList
            .assignAll(articles.map((e) => SeriesModel.fromJson(e)).toList());
        printInfo(info: " after ${searchList.length}");
      } else {
        // If that response was not OK, throw an error.
        printInfo(
            info:
                'API call returned: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      printInfo(info: e.toString());
    }
  } */
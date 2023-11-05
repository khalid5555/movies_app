import 'dart:convert';

import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/data/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// https://api.themoviedb.org/3/trending/tv/week?language=en-US //for trending tv
class MovieController extends GetxController {
  static var base = "https://api.themoviedb.org/3";
  static var api_key =
      "805d482bbe9f774e4c8231aeb0c303a2"; // Your API key to themoviedb.org is
  var moviesList = <FinalMoviesModel>[].obs;
  var seriesList = <SeriesModel>[].obs;
  var tvShowList = <dynamic>[].obs;
  var searchList = <SearchModel>[].obs;
  var categoryList = <FinalMoviesModelTest>[].obs;
  var currentPageSearch = 1.obs;
  var currentPageMovies = 1.obs;
  var currentPageSeries = 1.obs;
  var currentPageTv = 1.obs;
  var searchQuery = ''.obs;
  var isLoading = false.obs;
  final focusNode = FocusNode();
  final RxList<String> category = [
    "discover",
    "upcoming",
    "now_playing",
    "trending",
    "popular",
    "top_rated",
    "person",
  ].obs;
  final RxString currentCategory = "discover".obs;
  // var indexCategory = 0.obs;
  String language = 'ar-Eg';
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
    getTvShow();
    getMoviesBySearch();
    getMoviesByCategory();
    super.onInit();
  }

  Future<List<T>> fetchData<T>(
      String url, T Function(Map<String, dynamic>) fromJson) async {
    try {
      isLoading.value = true;
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        var data = jsonData['results'] as List;
        return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
      } else {
        Get.snackbar('error', response.reasonPhrase!,
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        printError(info: 'catch  ${response.reasonPhrase!.toString()}');
      }
    } catch (e) {
      printError(info: 'catch  ${e.toString()}');
      Get.snackbar('error', ('Failed to connect to the API or internet'),
          backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
    } finally {
      isLoading.value = false;
    }
    return [];
  }

  Future getMovies() async {
    //&language=ar-Eg
    var baseMovies =
        "$base/discover/movie?page=${currentPageMovies.value}&api_key=$api_key&language=$language";
    // var baseMovies =
    //     "$base/movie/upcoming?page=${currentPageMovies.value}&api_key=$api_key";
    try {
      // Uri uri = Uri.parse('https://imdb8.p.rapidapi.com/auto-complete?q=game');
      isLoading.value = true;
      printInfo(info: " {page=> of movies ${currentPageMovies.value}");
      Uri uri = Uri.parse(baseMovies);
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
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
        // Get.snackbar('error', response.reasonPhrase!,
        //     backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        Get.snackbar(
            'error', ('Failed to connect to the API${response.statusCode}'),
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
    String baseMovies;
    if (currentCategory.value == 'discover') {
      baseMovies =
          "$base/discover/movie?page=${currentPageMovies.value}&api_key=$api_key&language=ar-Eg";
    } else if (currentCategory.value.contains('person')) {
      baseMovies =
          "$base/person/popular?page=${currentPageMovies.value}&api_key=$api_key";
    } else if (currentCategory.value.contains('trending')) {
      baseMovies =
          "$base/trending/all/day?page=${currentPageMovies.value}&api_key=$api_key";
    } else {
      baseMovies =
          "$base/movie/${currentCategory.value}?page=${currentPageMovies.value}&api_key=$api_key";
    }
    //&language=ar-Eg
    // https://api.themoviedb.org/3/movie/upcoming?language=en-US&api_key=805d482bbe9f774e4c8231aeb0c303a2
    categoryList
        .assignAll(await fetchData(baseMovies, FinalMoviesModelTest.fromJson));
    // printInfo(
    //     info: 'ddddddddd ${categoryList.first.knownfor!.first!.overview}');
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
        Get.snackbar('error', ('Failed to connect to the API or internet'),
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        isLoading.value = false;
      }
    } catch (e) {
      printError(info: ' catch  $e');
      Get.snackbar('error', 'Failed to connect to the API or internet',
          backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
    }
  }

  Future getTvShow() async {
    // 'https://api.themoviedb.org/3/tv/on_the_air?language=en-US&page=1'
    try {
      isLoading.value = true;
      var baseTv =
          "$base/tv/on_the_air?page=${currentPageTv.value}&api_key=$api_key";
      printInfo(info: " {page=> of getTvShow ${currentPageTv.value}");
      Uri uri = Uri.parse(baseTv);
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body); //&& language == 'ar-Eg'
        // printInfo(info: 'jsonData: $jsonData');
        var movies = jsonData['results'] as List;
        printInfo(info: " before tvShowList2 ${tvShowList.length}");
        tvShowList
            .assignAll(movies.map((e) => SearchModel.fromJson(e)).toList());
        printInfo(info: " after tvShowList2 ${tvShowList.length}");
        isLoading.value = false;
        update();
      } else {
        printInfo(
            info:
                'API call returned: ${response.statusCode} ${response.reasonPhrase}');
        Get.snackbar('Error', ('Failed to connect to the API '),
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        isLoading.value = false;
      }
    } catch (e) {
      printError(info: ' catch  $e');
      Get.snackbar('Error', 'Failed to connect to the API or internet',
          backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
    }
  }

  Future getMoviesBySearch() async {
    var searchUrl =
        "$base/search/multi?query=${searchQuery.value}&page=${currentPageSearch.value}&api_key=$api_key";
    try {
      isLoading.value = true;
      printInfo(info: " {page=> of search ${currentPageSearch.value}");
      Uri uri = Uri.parse(searchUrl);
      final response = await http.get(uri, headers: _headers);
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        final jsonData = json.decode(response.body);
        var articles = jsonData['results'] as List;
//////////////////////////////
        if (searchQuery.value.trim().isEmpty) {
          // tvShowList.clear();
          // tvShowList
          //     .assignAll(articles.map((e) => SearchModel.fromJson(e)).toList());
          currentPageTv.value = 1;
          getTvShow();
          update();
        } else {
          // Filter the movies based on the search query
          var filteredMovies = articles.where((movie) {
            return movie
                .toString()
                .toLowerCase()
                .contains(searchQuery.value.toLowerCase());
          }).toList();
          tvShowList.assignAll(
              filteredMovies.map((e) => SearchModel.fromJson(e)).toList());
        }
/////////////////////////////////
        printInfo(info: " before search ${searchList.length}");
        // searchList
        //     .assignAll(articles.map((e) => SearchModel.fromJson(e)).toList());
        isLoading.value = false;
        update();
        printInfo(info: " after search ${searchList.length}");
      } else {
        // If that response was not OK, throw an error.
        printInfo(
            info:
                'API call returned: ${response.statusCode} ${response.reasonPhrase}');
        Get.snackbar(
            'error', ('Failed to connect to the API${response.statusCode}'),
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        isLoading.value = false;
      }
    } catch (e) {
      printInfo(info: e.toString());
      Get.snackbar('error', ('Failed to connect to the API or internet'),
          backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
      isLoading.value = false;
    }
  }

  void changeCategory(int index) {
    if (index >= 0 && index < category.length) {
      currentCategory.value = category[index];
      currentPageMovies.value = 1;
      getMoviesByCategory();
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

  void changePageTv() {
    if (currentPageTv.value < tvShowList.length) {
      currentPageTv.value++;
      getTvShow();
      printInfo(info: " {yes from tvShowList} ${currentPageTv.value}");
      update();
    } else {
      printInfo(info: " {nooooooooo tvShowList} ${currentPageTv.value}");
      update();
    }
  }

  void changePageMovie() {
    if (currentPageMovies.value < moviesList.length ||
        currentPageMovies.value < categoryList.length) {
      currentPageMovies.value++;
      getMovies();
      getMoviesByCategory();
      printInfo(info: " {yes from movies} ${currentPageMovies.value}");
      update();
    } else {
      printInfo(info: " {nooooooooo} ${currentPageMovies.value}");
      update();
    }
  }
  // void changePageSearch() {
  //   if (currentPageSearch.value < searchList.length) {
  //     currentPageSearch.value++;
  //     getMoviesBySearch();
  //     printInfo(info: " {yes from search} ${currentPageSearch.value}");
  //     update();
  //   } else {
  //     printInfo(info: " {nooooooooo} ${currentPageSearch.value}");
  //     update();
  //   }
  // }
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

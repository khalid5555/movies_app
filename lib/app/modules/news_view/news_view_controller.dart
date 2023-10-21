import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/data/models/news_model.dart';

const topHeadlines = "top-headlines";
const everything = "everything";
const String apiKey = "f278013c42cb402f8ba30770a2cc67cf";
const String apiKeyFornewsapiai = "3c0d4a76-25c2-4c99-900a-fc01a7a31ebd";
const String baseUrl = "https://newsapi.org/v2/";
const String baseUrlFornewsapiai =
    "http://eventregistry.org/api/v1/article/getArticles";

class NewsController extends GetxController {
  var search = ''.obs;
  RxList<NewsModel> newsList = <NewsModel>[].obs;
  final RxList category = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ].obs;
  final RxList<String> country =
      ["eg", "sa", "gb", "tr", "in", "it", "fr", "us"].obs;
  var indexCategory = 0.obs;
  var countryIndex = 0.obs;
  var isLoading = false.obs;
  String baseTopLines =
      "$baseUrl$topHeadlines?country=eg&category=general&apiKey=$apiKey";
  // String baseai =
  //     "$baseUrlFornewsapiai?keywords=apple&apiKey=$apiKeyFornewsapiai";
  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  final focusNode = FocusNode();
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void changeCategory(int index) {
    indexCategory.value = index;
    baseTopLines =
        "$baseUrl$topHeadlines?country=${country[countryIndex.value]}&category=${category[indexCategory.value]}&apiKey=$apiKey";
    fetchNews();
  }

  void countryChange() {
    baseTopLines =
        "$baseUrl$topHeadlines?country=${country[countryIndex.value]}&category=${category[indexCategory.value]}&apiKey=$apiKey";
    fetchNews();
  }

  void fetchNews() async {
    try {
      isLoading.value = true;
      var url = Uri.parse(baseTopLines);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = json.decode(utf8.decode(response.bodyBytes));
        var articles = jsonData['articles'] as List;
        printInfo(info: newsList.length.toString());
        newsList.assignAll(articles.map((e) => NewsModel.fromJson(e)).toList());
        printInfo(info: newsList.length.toString());
        isLoading.value = false;
        // for (var news in newsList) {
        //   printInfo(info: news.title.toString());
        // }
      } else {
        // Handle error
        printError(info: 'response.statusCode   ${response.statusCode}');
        Get.snackbar('error', response.reasonPhrase!,
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        isLoading.value = false;
      }
    } catch (e) {
      printError(info: 'response   ${e.toString()}');
      isLoading.value = false;
    }
  }

  void searchNews() async {
    String baseEverything =
        "$baseUrl$everything?q=${search.value}&apiKey=$apiKey";
    try {
      isLoading.value = true;
      var url = Uri.parse(baseEverything);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var articles = jsonData['articles'] as List;
        printInfo(info: newsList.length.toString());
        newsList.assignAll(articles.map((e) => NewsModel.fromJson(e)).toList());
        printInfo(info: newsList.length.toString());
        isLoading.value = false;
        // for (var news in newsList) {
        //   printInfo(info: news.title.toString());
        // }
      } else {
        // Handle error
        printError(info: 'response.statusCode   ${response.statusCode}');
        Get.snackbar('error', response.reasonPhrase!,
            backgroundColor: AppColors.kWhite, colorText: AppColors.kreColor);
        isLoading.value = false;
      }
    } catch (e) {
      printError(info: 'response   ${e.toString()}');
      isLoading.value = false;
    }
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/app/data/models/news_model.dart';

const topHeadlines = "top-headlines";
const everything = "everything";
const String apiKey = "f278013c42cb402f8ba30770a2cc67cf";
const String baseUrl = "https://newsapi.org/v2/";
String search = 'مصر';

class NewsViewController extends GetxController {
  List<NewsModel> newsList = <NewsModel>[].obs;
  String baseEverything = "$baseUrl$everything?q=$search&apiKey=$apiKey";
  String baseTopLines = "$baseUrl$topHeadlines?country=us&apiKey=$apiKey";
  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    try {
      var url = Uri.parse(baseTopLines);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var articles = jsonData['articles'] as List;
        printInfo(info: newsList.length.toString());
        newsList.assignAll(articles.map((e) => NewsModel.fromJson(e)).toList());
        printInfo(info: newsList.length.toString());
        // for (var news in newsList) {
        //   printInfo(info: news.title.toString());
        // }
      } else {
        // Handle error
        printError(info: 'response.statusCode   ${response.statusCode}');
      }
    } catch (e) {
      printError(info: 'response   ${e.toString()}');
    }
  }
}

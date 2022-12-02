import 'package:flutter/material.dart';
import 'package:practica5/models/news_models.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'https://newsapi.org/v2/';
const _APIKEY = 'f44af73f7388475184ea74f9e2a35048';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    const url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx';
    final response = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(response.body);
    this.headlines.addAll(newsResponse.articles as List<Article>);
    notifyListeners();
  }
}

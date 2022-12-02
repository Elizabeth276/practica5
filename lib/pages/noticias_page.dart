import 'package:flutter/material.dart';
import 'package:practica5/services/news_services.dart';
import 'package:practica5/widgets/list_news.dart';
import 'package:provider/provider.dart';

class PageNoticias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias API'),
      ),
      body: ListNews(newsService.headlines),
    );
  }
}

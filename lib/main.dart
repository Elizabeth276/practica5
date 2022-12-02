import 'package:flutter/material.dart';
import 'package:practica5/pages/noticia_detail.dart';
import 'package:practica5/pages/noticias_screen.dart';
import 'package:practica5/services/news_services.dart';
import 'package:practica5/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: NoticiasScreen()),
    );
  }
}

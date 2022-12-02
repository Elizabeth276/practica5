import 'package:flutter/material.dart';
import 'package:practica5/pages/noticias_page.dart';
import 'package:practica5/providers/navegacion_provider.dart';
import 'package:provider/provider.dart';

class NoticiasScreen extends StatelessWidget {
  const NoticiasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavegacionProvider(),
      child: Scaffold(
        body: PageNoticias(),
      ),
    );
  }
}

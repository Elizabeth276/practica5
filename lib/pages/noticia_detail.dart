import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practica5/models/news_models.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiaDetalle extends StatelessWidget {
  final Article noticia;

  const NoticiaDetalle({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: PageDetalle(noticia: noticia),
    );
  }
}

class PageDetalle extends StatelessWidget {
  final Article noticia;

  const PageDetalle({required this.noticia});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            _ImageContainer(noticia: noticia),
            const SizedBox(height: 0),
            InfoContainer(noticia: noticia),
          ],
        ),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  final Article noticia;

  const InfoContainer({required this.noticia});

  Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Can not launch URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade200,
      child: Column(
        children: [
          _HeaderNew(noticia: noticia),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black87,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'CONTENIDO',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  Text(
                    '${noticia.content}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  RawMaterialButton(
                    padding: const EdgeInsets.all(10),
                    onPressed: () async {
                      final url = noticia.url;
                      launchURL(url!);
                    },
                    fillColor: Colors.blue.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Ver noticia completa'),
                  ),
                  const Divider(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderNew extends StatelessWidget {
  const _HeaderNew({required this.noticia});

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: Text(
            '${noticia.publishedAt}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: Text(
            '${noticia.author}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({required this.noticia});

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: noticia.urlToImage != null
                ? NetworkImage('${noticia.urlToImage}') as ImageProvider
                : const AssetImage('assets/img/no-image.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Text(
          '${noticia.title}',
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              backgroundColor: Colors.black45),
        ),
      ),
    );
  }
}

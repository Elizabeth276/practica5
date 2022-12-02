import 'package:flutter/material.dart';
import 'package:practica5/models/news_models.dart';
import 'package:practica5/pages/noticia_detail.dart';
import 'package:practica5/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article>? noticias;
  const ListNews(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias!.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(
          noticia: this.noticias![index],
          index: index,
        );
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        _TarjetaTopBar(noticia: noticia, index: index),
        _TarjetTitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia),
        _TarjetaBody(noticia: noticia),
        _TarjetaBotones(noticia: noticia),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  final Article noticia;

  const _TarjetaBotones({required this.noticia});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoticiaDetalle(noticia: noticia)));
            },
            fillColor: Colors.blue.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.more,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description != null ? '${noticia.description}' : ''),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: noticia.urlToImage != null
              ? FadeInImage(
                  placeholder: const AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage('${noticia.urlToImage}'),
                )
              : const Image(image: AssetImage('assets/img/no-image.png')),
        ),
      ),
    );
  }
}

class _TarjetTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetTitulo({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        '${noticia.title}',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: TextStyle(color: theme.accentColor),
          ),
          Text('${noticia.source!.name}. '),
        ],
      ),
    );
  }
}

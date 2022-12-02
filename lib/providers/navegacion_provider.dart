import 'package:flutter/cupertino.dart';

class NavegacionProvider with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController(initialPage: 0);

  int get paginaActual => this._paginaActual;

  set paginaActual(int pagina) {
    this._paginaActual = pagina;
    _pageController.animateToPage(pagina,
        duration: const Duration(microseconds: 250), curve: Curves.bounceInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}

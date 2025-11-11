import 'package:flutter/material.dart';

class MarketProvider extends ChangeNotifier {
  String _selectedMarket = 'TetherUS - USDT';

  String get selectedMarket => _selectedMarket;

  void selectMarket(String market) {
    _selectedMarket = market;
    notifyListeners();
  }
}
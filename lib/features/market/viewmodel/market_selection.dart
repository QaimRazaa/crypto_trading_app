import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketProvider extends ChangeNotifier {
  String _selectedMarket = 'Indian - INR';

  String get selectedMarket => _selectedMarket;

  void selectMarket(String market) {
    _selectedMarket = market;
    notifyListeners();
  }
}
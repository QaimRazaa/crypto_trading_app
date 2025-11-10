import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider for Tab Management
class TabProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
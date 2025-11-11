import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:crypto_trading_app/features/home/data/model/coin_model.dart';

class CoinDetailProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isFavorite = false;
  String? _errorMessage;
  List<CoinModel> _favoriteCoins = [];

  bool get isLoading => _isLoading;
  bool get isFavorite => _isFavorite;
  String? get errorMessage => _errorMessage;
  List<CoinModel> get favoriteCoins => _favoriteCoins;

  // Load coin details and check if it's favorited
  Future<void> loadCoinDetails(String coinId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      // Check if coin is in favorites
      await _loadFavorites();
      _isFavorite = _favoriteCoins.any((coin) => coin.id == coinId);

    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Load favorites from shared preferences
  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList('favorite_coins') ?? [];
      _favoriteCoins = favoritesJson
          .map((json) => CoinModel.fromJson(jsonDecode(json)))
          .toList();
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }

  // Toggle favorite status
  Future<void> toggleFavorite(CoinModel coin) async {
    _isFavorite = !_isFavorite;

    if (_isFavorite) {
      // Add to favorites
      _favoriteCoins.add(coin);
    } else {
      // Remove from favorites
      _favoriteCoins.removeWhere((c) => c.id == coin.id);
    }

    // Save to shared preferences
    await _saveFavorites();
    notifyListeners();
  }

  // Save favorites to shared preferences
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = _favoriteCoins
          .map((coin) => jsonEncode(coin.toJson()))
          .toList();
      await prefs.setStringList('favorite_coins', favoritesJson);
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  // Public method to load favorites (for FavouritesScreen)
  Future<void> loadFavorites() async {
    _isLoading = true;
    notifyListeners();

    await _loadFavorites();

    _isLoading = false;
    notifyListeners();
  }
}
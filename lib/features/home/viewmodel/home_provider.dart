import 'package:flutter/foundation.dart';
import '../../../services/coin_services.dart';
import '../../home/data/model/coin_model.dart';

class HomeProvider with ChangeNotifier {
  final CoinService _coinService = CoinService();

  List<CoinModel> _coins = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<CoinModel> get coins => _coins;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Fetch top coins
  Future<void> loadCoins({int perPage = 25}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final coins = await _coinService.fetchCoins(perPage: perPage);
      _coins = coins;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Refresh coins manually (like pull-to-refresh)
  Future<void> refreshCoins() async {
    await loadCoins();
  }
}

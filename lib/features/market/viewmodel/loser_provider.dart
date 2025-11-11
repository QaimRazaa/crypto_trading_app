import 'package:flutter/foundation.dart';
import '../../../services/coin_services.dart';
import '../../home/data/model/coin_model.dart';

class LosersProvider with ChangeNotifier {
  final CoinService _coinService = CoinService();

  List<CoinModel> _losers = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<CoinModel> get losers => _losers;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Fetch top losers
  Future<void> loadLosers({int perPage = 25}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final losers = await _coinService.fetchLosers(perPage: perPage);
      _losers = losers;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Refresh losers
  Future<void> refreshLosers() async {
    await loadLosers();
  }
}
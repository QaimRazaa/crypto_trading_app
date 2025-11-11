import 'package:flutter/foundation.dart';
import '../../../services/coin_services.dart';
import '../../home/data/model/coin_model.dart';

class HomeProvider with ChangeNotifier {
  final CoinService _coinService = CoinService();

  List<CoinModel> _coins = [];
  List<CoinModel> _gainers = [];
  List<CoinModel> _losers = [];

  bool _isLoading = false;
  bool _isLoadingGainers = false;
  bool _isLoadingLosers = false;
  String? _errorMessage;
  String? _errorMessageGainers;
  String? _errorMessageLosers;

  String _selectedMarket = 'TetherUS - USDT';
  double _usdToPkrRate = 278.0;
  bool _isLoadingRate = false;

  List<CoinModel> get coins => _coins;
  List<CoinModel> get gainers => _gainers;
  List<CoinModel> get losers => _losers;

  bool get isLoading => _isLoading;
  bool get isLoadingGainers => _isLoadingGainers;
  bool get isLoadingLosers => _isLoadingLosers;
  String? get errorMessage => _errorMessage;
  String? get errorMessageGainers => _errorMessageGainers;
  String? get errorMessageLosers => _errorMessageLosers;
  String get selectedMarket => _selectedMarket;
  double get usdToPkrRate => _usdToPkrRate;
  bool get isLoadingRate => _isLoadingRate;
  bool get isPkrSelected => _selectedMarket == 'Pakistani - PKR';

  HomeProvider() {
    loadPkrRate();
  }

  Future<void> selectMarket(String market) async {
    _selectedMarket = market;
    notifyListeners();

    await Future.wait([
      loadCoins(perPage: 50, displayLimit: 50),
      loadGainers(perPage: 50, displayLimit: 50),
      loadLosers(perPage: 50, displayLimit: 50),
    ]);
  }

  Future<void> loadPkrRate() async {
    _isLoadingRate = true;
    notifyListeners();

    try {
      _usdToPkrRate = await _coinService.fetchUsdToPkrRate();
    } finally {
      _isLoadingRate = false;
      notifyListeners();
    }
  }

  Future<void> loadCoins({int perPage = 50, int? displayLimit}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final coins = await _coinService.fetchCoins(perPage: perPage);
      _coins = displayLimit != null && displayLimit < coins.length
          ? coins.take(displayLimit).toList()
          : coins;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshCoins() async {
    final currentLimit = _coins.length;
    await loadCoins(perPage: 50, displayLimit: currentLimit > 0 ? currentLimit : null);
  }

  Future<void> loadGainers({int perPage = 50, int? displayLimit}) async {
    _isLoadingGainers = true;
    _errorMessageGainers = null;
    notifyListeners();

    try {
      final gainers = await _coinService.fetchGainers(perPage: perPage);
      _gainers = displayLimit != null && displayLimit < gainers.length
          ? gainers.take(displayLimit).toList()
          : gainers;
      _errorMessageGainers = null;
    } catch (e) {
      _errorMessageGainers = e.toString();
    } finally {
      _isLoadingGainers = false;
      notifyListeners();
    }
  }

  Future<void> refreshGainers() async {
    final currentLimit = _gainers.length;
    await loadGainers(perPage: 50, displayLimit: currentLimit > 0 ? currentLimit : null);
  }

  Future<void> loadLosers({int perPage = 50, int? displayLimit}) async {
    _isLoadingLosers = true;
    _errorMessageLosers = null;
    notifyListeners();

    try {
      final losers = await _coinService.fetchLosers(perPage: perPage);
      _losers = displayLimit != null && displayLimit < losers.length
          ? losers.take(displayLimit).toList()
          : losers;
      _errorMessageLosers = null;
    } catch (e) {
      _errorMessageLosers = e.toString();
    } finally {
      _isLoadingLosers = false;
      notifyListeners();
    }
  }

  Future<void> refreshLosers() async {
    final currentLimit = _losers.length;
    await loadLosers(perPage: 50, displayLimit: currentLimit > 0 ? currentLimit : null);
  }

  Future<void> refreshAll() async {
    await Future.wait([
      refreshCoins(),
      refreshGainers(),
      refreshLosers(),
      loadPkrRate(),
    ]);
  }
}
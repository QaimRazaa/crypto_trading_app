import 'dart:convert';
import 'package:http/http.dart' as http;
import '../features/home/data/model/coin_model.dart';

class CoinService {
  static const String baseUrl = 'https://api.coingecko.com/api/v3';

  Future<List<CoinModel>> fetchCoins({int perPage = 50, int page = 1}) async {
    try {
      final url = Uri.parse(
          '$baseUrl/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=$perPage&page=$page&sparkline=false'
      );

      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((e) => CoinModel.fromJson(e)).toList();
      } else if (response.statusCode == 429) {
        throw Exception('Rate limit exceeded. Please try again later.');
      } else {
        throw Exception('Failed to load coins: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching coins: $e');
    }
  }

  Future<List<CoinModel>> fetchGainers({int perPage = 50}) async {
    try {
      final url = Uri.parse(
          '$baseUrl/coins/markets?vs_currency=usd&order=price_change_percentage_24h_desc&per_page=$perPage&page=1&sparkline=false'
      );

      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        List<CoinModel> coins = data.map((e) => CoinModel.fromJson(e)).toList();

        return coins.where((coin) => coin.priceChangePercentage24h > 0).toList();
      } else if (response.statusCode == 429) {
        throw Exception('Rate limit exceeded. Please try again later.');
      } else {
        throw Exception('Failed to load gainers: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching gainers: $e');
    }
  }

  Future<List<CoinModel>> fetchLosers({int perPage = 50}) async {
    try {
      final url = Uri.parse(
          '$baseUrl/coins/markets?vs_currency=usd&order=price_change_percentage_24h_asc&per_page=$perPage&page=1&sparkline=false'
      );

      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        List<CoinModel> coins = data.map((e) => CoinModel.fromJson(e)).toList();

        return coins.where((coin) => coin.priceChangePercentage24h < 0).toList();
      } else if (response.statusCode == 429) {
        throw Exception('Rate limit exceeded. Please try again later.');
      } else {
        throw Exception('Failed to load losers: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching losers: $e');
    }
  }
  Future<double> fetchUsdToPkrRate() async {
    try {
      final url = Uri.parse('$baseUrl/simple/price?ids=tether&vs_currencies=pkr');
      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['tether']['pkr']?.toDouble() ?? 278.0;
      } else {
        throw Exception('Failed to fetch USD to PKR rate');
      }
    } catch (e) {
      throw Exception('Error fetching USD to PKR rate: $e');
    }
  }

}
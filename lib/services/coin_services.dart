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
}
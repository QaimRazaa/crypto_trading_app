class CoinModel {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double? fullyDilutedValuation;
  final double totalVolume;
  final double high24h;
  final double low24h;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double marketCapChange24h;
  final double marketCapChangePercentage24h;
  final double circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double ath;
  final double athChangePercentage;
  final String athDate;
  final double atl;
  final double atlChangePercentage;
  final String atlDate;
  final dynamic roi;
  final String lastUpdated;

  CoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCapChange24h,
    required this.marketCapChangePercentage24h,
    required this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    this.roi,
    required this.lastUpdated,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'] ?? '',
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      currentPrice: (json['current_price'] ?? 0).toDouble(),
      marketCap: (json['market_cap'] ?? 0).toDouble(),
      marketCapRank: json['market_cap_rank'] ?? 0,
      fullyDilutedValuation: json['fully_diluted_valuation']?.toDouble(),
      totalVolume: (json['total_volume'] ?? 0).toDouble(),
      high24h: (json['high_24h'] ?? 0).toDouble(),
      low24h: (json['low_24h'] ?? 0).toDouble(),
      priceChange24h: (json['price_change_24h'] ?? 0).toDouble(),
      priceChangePercentage24h: (json['price_change_percentage_24h'] ?? 0).toDouble(),
      marketCapChange24h: (json['market_cap_change_24h'] ?? 0).toDouble(),
      marketCapChangePercentage24h: (json['market_cap_change_percentage_24h'] ?? 0).toDouble(),
      circulatingSupply: (json['circulating_supply'] ?? 0).toDouble(),
      totalSupply: json['total_supply']?.toDouble(),
      maxSupply: json['max_supply']?.toDouble(),
      ath: (json['ath'] ?? 0).toDouble(),
      athChangePercentage: (json['ath_change_percentage'] ?? 0).toDouble(),
      athDate: json['ath_date'] ?? '',
      atl: (json['atl'] ?? 0).toDouble(),
      atlChangePercentage: (json['atl_change_percentage'] ?? 0).toDouble(),
      atlDate: json['atl_date'] ?? '',
      roi: json['roi'],
      lastUpdated: json['last_updated'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'image': image,
      'current_price': currentPrice,
      'market_cap': marketCap,
      'market_cap_rank': marketCapRank,
      'fully_diluted_valuation': fullyDilutedValuation,
      'total_volume': totalVolume,
      'high_24h': high24h,
      'low_24h': low24h,
      'price_change_24h': priceChange24h,
      'price_change_percentage_24h': priceChangePercentage24h,
      'market_cap_change_24h': marketCapChange24h,
      'market_cap_change_percentage_24h': marketCapChangePercentage24h,
      'circulating_supply': circulatingSupply,
      'total_supply': totalSupply,
      'max_supply': maxSupply,
      'ath': ath,
      'ath_change_percentage': athChangePercentage,
      'ath_date': athDate,
      'atl': atl,
      'atl_change_percentage': atlChangePercentage,
      'atl_date': atlDate,
      'roi': roi,
      'last_updated': lastUpdated,
    };
  }
  String getFormattedPrice(bool isPkr, double pkrRate) {
    if (isPkr) {
      final pkrPrice = currentPrice * pkrRate;
      return 'Rs ${pkrPrice.toStringAsFixed(2)}';
    }
    return '\$${currentPrice.toStringAsFixed(2)}';
  }

  String get formattedPercentage => '${priceChangePercentage24h >= 0 ? '+' : ''}${priceChangePercentage24h.toStringAsFixed(2)}%';

  bool get isPricePositive => priceChangePercentage24h >= 0;

  String get formattedPrice => '\$${currentPrice.toStringAsFixed(2)}';

}
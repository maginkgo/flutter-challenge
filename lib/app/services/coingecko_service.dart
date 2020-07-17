import 'package:dio/dio.dart';

import '../data/models/coin_model.dart';

const _BASE_URL = 'https://api.coingecko.com/api/v3';

class CoinGeckoService {
  final Dio httpClient;

  CoinGeckoService() : httpClient = Dio(BaseOptions(baseUrl: _BASE_URL));

  Future<List<CoinModel>> getCoins() async {
    final coins = <CoinModel>[];
    try {
      final response = await httpClient.get('/coins/list');
      if (response.statusCode == 200) {
        final data = response.data as List;
        coins.addAll(
          List<CoinModel>.from(data.map((c) => CoinModel.fromMap(c))),
        );
      }
    } catch (e) {
      print(e);
    }
    return coins;
  }

  Future<List<CoinModel>> updateCoins(List<CoinModel> coins) async {
    final ids = coins.map((c) => c.id).join(',');
    final response = await httpClient.get(
      '/simple/price',
      queryParameters: {'ids': ids, 'vs_currencies': 'usd'},
    );
    final data = response.data as Map<String, dynamic>;
    coins = coins.map((c) => c.copyWith(usdPrice: data[c.id]['usd'])).toList();
    return coins;
  }

  Future<CoinModel> getCoinById(CoinModel coin) async {
    try {
      final response = await httpClient.get(
        '/coins/${coin.id}',
        queryParameters: {
          'localization': false,
          'tickers': false,
          'market_data': true,
          'community_data': false,
          'developer_data': false,
          'sparkline': false
        },
      );
      final data = response.data as Map<String, dynamic>;
      coin = coin.copyWith(
        image: data["image"]["thumb"],
        usdPrice: data["market_data"]["current_price"]["usd"],
      );
    } catch (e) {
      print(e);
    }
    return coin;
  }
}

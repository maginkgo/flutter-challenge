import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

import '../../../../services/coingecko_service.dart';
import '../models/coin_model.dart';
export '../models/coin_model.dart';

class HomeRepository {
  final CoinGeckoService _coinGeckoApi;
  final localStorage = GetStorage();

  final coins = Set<CoinModel>();
  final selectedCoins = Set<CoinModel>();

  HomeRepository({
    @required CoinGeckoService coinGeckoApi,
  })  : assert(coinGeckoApi != null),
        _coinGeckoApi = coinGeckoApi {
    getCoins();
    getSelectedCoins();
  }

  Future<void> getCoins() async {
    coins.addAll(await _coinGeckoApi.getCoins());
  }

  Future<void> getSelectedCoins() async {
    if (localStorage.hasData('coinIds')) {
      final coinIds = localStorage.read<List<dynamic>>('coinIds');
      selectedCoins.addAll(
        coinIds.map((id) => CoinModel.fromMap(localStorage.read(id))),
      );
    }
  }

  Future<List<CoinModel>> updateCoins(List<CoinModel> coins) async {
    coins = await _coinGeckoApi.updateCoins(coins);
    selectedCoins.clear();
    selectedCoins.addAll(coins);
    await _updateLocalStorage();
    return coins;
  }

  Future<void> deleteCoin(CoinModel coin) async {
    if (selectedCoins.remove(coin)) await localStorage.remove(coin.id);
  }

  Future<CoinModel> getCoinById(CoinModel coin) async {
    return await _coinGeckoApi.getCoinById(coin);
  }

  Future<void> addSelectedCoin(CoinModel coin) async {
    selectedCoins.add(coin);
    await localStorage.write(coin.id, coin.toMap());
    await _updateLocalStorage();
  }

  Future<void> _updateLocalStorage() async {
    final coinIds = selectedCoins.map((c) => c.id).toList();
    await localStorage.write('coinIds', coinIds);
  }
}

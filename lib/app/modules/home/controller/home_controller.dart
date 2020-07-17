import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

import '../data/repositories/home_repository.dart';

class HomeController extends GetxController {
  final TabController tabController;
  final HomeRepository _homeRepository;
  final inputCoinController = TextEditingController(text: '');

  final isLoading = false.obs;

  final selectedCoins = <CoinModel>[].obs;

  final isDartMode = false.obs;

  HomeController({
    @required HomeRepository homeRepository,
    @required TickerProvider tickerProvider,
  })  : assert(tickerProvider != null),
        assert(homeRepository != null),
        _homeRepository = homeRepository,
        tabController = TabController(length: 2, vsync: tickerProvider);

  void addCoin(CoinModel coin) async {
    isLoading.value = true;
    Get.focusScope.unfocus();
    inputCoinController.clear();
    coin = await _homeRepository.getCoinById(coin);
    tabController.animateTo(1);
    selectedCoins.add(coin);
    await _homeRepository.addSelectedCoin(coin);
    isLoading.value = false;
  }

  Future<void> deleteCoin(CoinModel coin) async {
    await _homeRepository.deleteCoin(coin);
    selectedCoins.remove(coin);
  }

  CoinModel getNewCoinData() {
    final coins = _homeRepository.coins;
    final value = inputCoinController.text.trim().toUpperCase();
    return coins.firstWhere(
      (c) => c.name == value || c.symbol == value,
      orElse: () => null,
    );
  }

  Future<void> onRefresh() async {
    final coins = await _homeRepository.updateCoins(selectedCoins.value);
    selectedCoins.clear();
    selectedCoins.addAll(coins);
  }

  void changeTheme(bool state) {
    isDartMode.value = state;
    GetStorage().write('darkmode', state);
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }

  @override
  void onInit() async {
    selectedCoins.addAll(_homeRepository.selectedCoins);
    if (selectedCoins.isNotEmpty) tabController.animateTo(1);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    inputCoinController.dispose();
    super.onClose();
  }
}

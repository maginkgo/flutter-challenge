import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/coingecko_service.dart';
import 'controller/home_controller.dart';
import 'data/repositories/home_repository.dart';
import 'widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  HomeController controller;

  @override
  void initState() {
    controller = Get.put(HomeController(
      tickerProvider: this,
      homeRepository: Get.put(
        HomeRepository(
          coinGeckoApi: CoinGeckoService(),
        ),
      ),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeCoins'),
        bottom: const TabBarHome(),
        actions: [
          Obx(() {
            return Switch(
              value: controller.isDartMode.value,
              onChanged: controller.changeTheme,
            );
          })
        ],
      ),
      body: TabBarViewHome(),
    );
  }
}

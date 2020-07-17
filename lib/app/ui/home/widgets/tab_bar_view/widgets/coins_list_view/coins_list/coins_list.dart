import 'package:challenge/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

import 'coin_tile/coin_tile.dart';

class CoinsList extends StatelessWidget {
  const CoinsList({Key key, @required this.coins}) : super(key: key);

  final List<CoinModel> coins;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: Get.find<HomeController>().onRefresh,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: coins.length,
        itemBuilder: (c, index) => CoinTile(coin: coins[index]),
      ),
    );
  }
}

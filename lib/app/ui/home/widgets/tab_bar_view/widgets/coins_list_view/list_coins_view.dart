import 'package:challenge/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

import 'coins_list/coins_list.dart';

class ListCoinsView extends StatelessWidget {
  final c = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[100],
      child: Obx(() {
        final coins = c.selectedCoins.value.reversed.toList();
        if (coins.length == 0)
          return Center(
            child: Text(
              'There are no selected coins to show yet',
              style: Get.textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          );
        else
          return CoinsList(coins: coins);
      }),
    );
  }
}

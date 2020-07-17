import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import 'widgets/add_coin_view/add_coin_view.dart';
import 'widgets/coins_list_view/list_coins_view.dart';

class TabBarViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: Get.find<HomeController>().tabController,
      children: [
        AddCoinView(),
        ListCoinsView(),
      ],
    );
  }
}

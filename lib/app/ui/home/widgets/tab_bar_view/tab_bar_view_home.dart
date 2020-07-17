import 'package:challenge/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

import 'widgets/tab_bar_view_widgets.dart';

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

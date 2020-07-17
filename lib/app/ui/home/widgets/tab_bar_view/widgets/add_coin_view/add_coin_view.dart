import 'package:flutter/material.dart';

import '../../../../../../controller/home_controller.dart';
import 'widgets/add_coin_view_widgets.dart';

class AddCoinView extends StatelessWidget {
  final c = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: c.isDartMode.value ? Colors.grey : Colors.indigo[50],
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            LabelField(),
            CoinField(),
            AddCoinButton(),
          ],
        ),
      ),
    );
  }
}

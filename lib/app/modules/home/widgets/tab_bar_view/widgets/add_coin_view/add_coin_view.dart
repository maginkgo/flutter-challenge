import 'package:defiant_challenge/app/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

import 'add_coin_button/add_coin_button.dart';
import 'add_coin_field/add_coin_field.dart';
import 'add_coin_label/add_coin_label.dart';

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

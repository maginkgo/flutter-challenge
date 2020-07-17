import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/home_controller.dart';

class CoinField extends StatelessWidget {
  final c = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: c.inputCoinController,
          style: Get.theme.textTheme.headline5.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: Colors.indigo[900],
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            fillColor: Colors.indigo[50],
            filled: true,
          ),
        ),
      ),
    );
  }
}

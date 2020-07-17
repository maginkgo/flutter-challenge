import 'package:challenge/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

class CoinField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: Get.find<HomeController>().inputCoinController,
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

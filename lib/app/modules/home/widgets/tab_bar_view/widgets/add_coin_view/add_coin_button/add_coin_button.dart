import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/home_controller.dart';
import '../../../../../data/models/coin_model.dart';

class AddCoinButton extends StatelessWidget {
  final c = Get.find<HomeController>();

  void _showSnack({CoinModel coin}) => Get.snackbar(
        coin != null ? '${coin.name} (${coin.symbol})' : 'Ups, sorry!',
        '',
        messageText: Text(
          coin != null
              ? 'Has already been selected'
              : 'It isn\'t a valid coin. Try again',
          style: Get.theme.textTheme.headline6,
        ),
        barBlur: 0,
        overlayBlur: 50,
        borderRadius: 8,
        borderColor: Get.theme.primaryColor,
        backgroundColor: Get.theme.secondaryHeaderColor,
        isDismissible: true,
        borderWidth: 2,
        duration: Duration(seconds: 2),
        icon: const Icon(Icons.error_outline, color: Colors.red),
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        margin: const EdgeInsets.symmetric(vertical: 200, horizontal: 16),
      );

  void _showDialog(CoinModel coin) => Get.defaultDialog(
        title: 'Do you want to add: ',
        onConfirm: () {
          c.addCoin(coin);
          Get.back();
        },
        onCancel: () => Get.back(),
        middleText: '${coin.name} (${coin.symbol})',
        textCancel: 'CANCEL',
        textConfirm: 'OK',
        confirmTextColor: Colors.indigo[50],
        radius: 8,
      );

  void _onPressed() {
    var coin = c.getNewCoinData();
    if (coin == null) _showSnack();
    if (c.selectedCoins.contains(coin))
      _showSnack(coin: coin);
    else
      _showDialog(coin);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return c.isLoading.value
          ? CircularProgressIndicator()
          : FloatingActionButton.extended(
              label: const Text('ADD COIN'),
              icon: const Icon(Icons.add),
              onPressed: _onPressed,
            );
    });
  }
}

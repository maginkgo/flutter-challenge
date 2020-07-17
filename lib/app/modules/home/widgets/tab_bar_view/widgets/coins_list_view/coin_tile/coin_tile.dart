import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/home_controller.dart';
import '../../../../../data/models/coin_model.dart';

class CoinTile extends StatelessWidget {
  const CoinTile({Key key, @required this.coin}) : super(key: key);

  final CoinModel coin;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigo[50],
          child: coin.image != null ? Image.network(coin.image) : null,
        ),
        title: Text('${coin.name} (${coin.symbol})'),
        subtitle: Text('USD ${coin.usdPrice}'),
        trailing: PopupMenuButton<CoinModel>(
          onSelected: Get.find<HomeController>().deleteCoin,
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<CoinModel>>[
              PopupMenuItem<CoinModel>(
                value: coin,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.delete, color: Colors.red),
                    const Text('Delete'),
                  ],
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../controller/home_controller.dart';

class TabBarHome extends StatelessWidget implements PreferredSizeWidget {
  const TabBarHome() : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: Get.find<HomeController>().tabController,
      tabs: [
        const Tab(
          //icon: const Icon(Icons.search),
          child: const Text('ADD'),
        ),
        const Tab(
          //icon: const Icon(Icons.list),
          child: const Text('LIST'),
        ),
      ],
    );
  }
}

import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/ui/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage().writeIfNull('darkmode', false);
    final isDarkMode = GetStorage().read('darkmode');
    return GetMaterialApp(
      title: 'Defiant Demo',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen.navigate(
        backgroundColor: Theme.of(context).backgroundColor,
        name: 'assets/intro.flr',
        next: (context) => HomePage(),
        until: () => Future.delayed(Duration(seconds: 5)),
        startAnimation: '1',
      ),
    );
  }
}

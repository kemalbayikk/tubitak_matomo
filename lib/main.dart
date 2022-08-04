import 'package:flutter/material.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';
import 'package:matomo/matomo.dart';
import 'package:logging/logging.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  MyApp() {
     Logger.root.level = Level.FINEST;
    Logger.root.onRecord.listen((LogRecord rec) {
      print(
          '[${rec.time}][${rec.level.name}][${rec.loggerName}] ${rec.message}');
    });

    MatomoTracker().initialize(
      siteId: 1,
      url: 'http://192.168.177.129/matomo/matomo.php',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

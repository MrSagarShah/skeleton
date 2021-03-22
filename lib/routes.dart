import 'package:flutter/material.dart';

import 'ui/splash/ui/splace_screen.dart';


class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    // login: (BuildContext context) => LoginScreen(),
    // home: (BuildContext context) => HomeScreen(),
  };
}

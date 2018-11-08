import 'package:flutter/material.dart';
import 'package:final_21300765/home.dart';
import 'package:final_21300765/login.dart';

class MarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market',
      home: LoginPage(),
//      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      routes: {
        '/home' : (context) => HomePage(),
        '/login' : (context) => LoginPage(),
      },
    );
  }

  Route<dynamic> _getRoute(RouteSettings setting) {
    if (setting.name != 'login') { return null; }
    return MaterialPageRoute<void> (
      settings: setting,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

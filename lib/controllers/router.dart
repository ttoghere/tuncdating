import 'package:flutter/material.dart';

import '../views/screens/auth/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return LoginScreen();
            });
      case RegistrationScreen.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return RegistrationScreen();
            });
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return const Center(
          child: Text("Error Page"),
        );
      },
    );
  }
}

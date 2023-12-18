import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utilies/routes/routes_name.dart';
import 'package:mvvm_architecture/view/hom_page.dart';
import 'package:mvvm_architecture/view/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //case for home screen route
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      //case for loig screen route
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No Route defined"),
            ),
          );
        });
    }
  }
}

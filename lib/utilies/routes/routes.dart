import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utilies/routes/routes_name.dart';
import 'package:mvvm_architecture/view/hom_page.dart';
import 'package:mvvm_architecture/view/login_view.dart';
import 'package:mvvm_architecture/view/signup_view.dart';
import 'package:mvvm_architecture/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //case for home screen route
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      //case for login screen route
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      //case for  signup page
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUPView());

      //case fo splash view
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());

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

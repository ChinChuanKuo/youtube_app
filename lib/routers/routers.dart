import 'package:flutter/material.dart';
import 'package:youtube_app/views/views.dart';

class Routers {
  DefaultView defaultRoute;
  HomeView homeRoute;
  VideoView videoRoute;
}

abstract class Routes {
  static const defaultRoute = "/";
  static const homeRoute = "/";
  static const videoRoute = "/video";
}

class RouterGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.defaultRoute:
        return MaterialPageRoute(
          builder: (_) => DefaultView(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      case Routes.videoRoute:
        return MaterialPageRoute(
          builder: (_) => VideoView(),
        );
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}

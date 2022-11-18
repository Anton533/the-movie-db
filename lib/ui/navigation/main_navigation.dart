import 'package:flutter/material.dart';
import 'package:themoviedb/ui/widgets/main_screen/main_screen_model.dart';

import '../../Library/Widgets/Inherited/provider.dart';
import '../widgets/auth/auth_model.dart';
import '../widgets/auth/auth_widget.dart';
import '../widgets/main_screen/main_screen_widget.dart';
import '../widgets/movie_details_widget/movie_details_widget.dart';

abstract class MainNavigationRoutNames {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRoutNames.mainScreen
      : MainNavigationRoutNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutNames.auth: (context) => NotifierProvider(
          model: AuthModel(),
          child: const AuthWidget(),
        ),
    MainNavigationRoutNames.mainScreen: (context) => NotifierProvider(
          model: MainScreenModel(),
          child: const MainScreenWidget(),
        )
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => MovieDetailsWidget(movieId: movieId),
        );
      default:
        const widget = Text('Navigation error!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}

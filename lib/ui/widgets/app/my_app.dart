import 'package:flutter/material.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';
import 'package:themoviedb/ui/widgets/app/my_app_model.dart';
import '../../theme/app_colors.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;
  static final mainNavigation = MainNavigation();
  const MyApp({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'the_movie_db',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.mainDarckBlue,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainDarckBlue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          )),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(model.isAuth),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}

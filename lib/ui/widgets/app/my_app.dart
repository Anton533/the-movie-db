import 'package:flutter/material.dart';
import 'package:themoviedb/ui/widgets/auth/auth_model.dart';
import '../../theme/app_colors.dart';
import '../auth/auth_widget.dart';
import '../main_screen/main_screen_widget.dart';
import '../movie_details_widget/movie_details_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      routes: {
        '/auth': (context) => AuthModelProvider(
              model: AuthModel(),
              child: const AuthWidget(),
            ),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return const MovieDetailsWidget(movieId: 1);
          }
        },
      },
      initialRoute: '/auth',
    );
  }
}

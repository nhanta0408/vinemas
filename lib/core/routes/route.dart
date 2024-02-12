import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/home_route.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/login/presentation/login_routes.dart';
import '../../features/login/presentation/views/login_screen.dart';
import '../../features/movie_detail/presentation/movie_detail_route.dart';
import '../../features/movie_detail/presentation/views/movie_detail_screen.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginRoute.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => LoginBloc(),
              child: const LoginScreen(),
            );
          },
        );
      case HomeRoute.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => HomeBloc(),
              child: const HomeScreen(),
            );
          },
        );

      case MovieDetailRoute.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return const MovieDetailScreen();
          },
        );
    }
    return null;
  }
}

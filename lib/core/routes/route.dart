import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinemas_app/features/home/presentation/home_route.dart';
import 'package:vinemas_app/features/home/presentation/views/home_screen.dart';
import 'package:vinemas_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:vinemas_app/features/login/presentation/login_routes.dart';
import 'package:vinemas_app/features/login/presentation/views/login_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginRoute.routeName:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginScreen(),
          );
        });
      case HomeRoute.routeName:
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        });
    }
    return null;
  }
}

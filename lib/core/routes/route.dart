import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di/di.dart';
import '../../features/account/presentation/account_route.dart';
import '../../features/account/presentation/bloc/account_bloc.dart';
import '../../features/account/presentation/views/account_screen.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/presentation/home_route.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/login/presentation/login_routes.dart';
import '../../features/login/presentation/views/login_screen.dart';
import '../../features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import '../../features/movie_detail/presentation/movie_detail_route.dart';
import '../../features/movie_detail/presentation/views/movie_detail_screen.dart';
import '../../features/seat_selection/presentation/bloc/seat_selection_bloc.dart';
import '../../features/seat_selection/presentation/seat_selection_route.dart';
import '../../features/seat_selection/presentation/views/seat_selection_screen.dart';
import '../../features/ticket_detail/presentation/ticket_detail_route.dart';
import '../../features/ticket_detail/presentation/views/ticket_detail_screen.dart';

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
              create: (context) => getIt<HomeBloc>(),
              child: const HomeScreen(),
            );
          },
        );

      case MovieDetailRoute.routeName:
        if (settings.arguments is! MovieDetailScreenArg) {
          return null;
        }
        final arg = settings.arguments as MovieDetailScreenArg;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt<MovieDetailBloc>(),
              child: MovieDetailScreen(
                movieId: arg.movieId,
              ),
            );
          },
        );
      case SeatSelectionRoute.routeName:
        if (settings.arguments is! SeatSelectionScreenArg) {
          return null;
        }
        final arg = settings.arguments as SeatSelectionScreenArg;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt<SeatSelectionBloc>(),
              child: SeatSelectionScreen(
                sessionModel: arg.sessionModel,
                movieDetailEntity: arg.movieDetailEntity,
              ),
            );
          },
        );

      case TicketDetailRoute.routeName:
        if (settings.arguments is! TicketDetailScreenArg) {
          return null;
        }
        final arg = settings.arguments as TicketDetailScreenArg;
        return MaterialPageRoute(
          builder: (context) {
            return TicketDetailScreen(
              ticket: arg.ticket,
            );
          },
        );

      case AccountRoute.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt<AccountBloc>(),
              child: const AccountScreen(),
            );
          },
        );
    }
    return null;
  }
}

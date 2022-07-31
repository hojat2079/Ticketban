import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';
import 'package:ticketban_mobile/presentation/screen/auth/auth.dart';
import 'package:ticketban_mobile/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/presentation/screen/home/home.dart';

class AppRoute {
  final getIt = GetIt.instance;
  late final AuthBloc _authBloc =
      AuthBloc(authRepository: getIt<AuthRepository>())..add(AuthStarted());

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider.value(
              value: _authBloc,
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: AuthScreen(),
              ),
            );
          },
        );
      case HomeScreen.route:
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        });
      default:
        throw Exception('root is not valid');
    }
  }

  void dispose() {
    _authBloc.close();
  }
}

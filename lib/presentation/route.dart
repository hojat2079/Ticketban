import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';
import 'package:ticketban_mobile/presentation/screen/add_ticket/add_ticket_screen.dart';
import 'package:ticketban_mobile/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:ticketban_mobile/presentation/screen/auth/forget_password_screen.dart';
import 'package:ticketban_mobile/presentation/screen/auth/login_screen.dart';
import 'package:ticketban_mobile/presentation/screen/auth/otp_screen.dart';
import 'package:ticketban_mobile/presentation/screen/auth/register_screen.dart';
import 'package:ticketban_mobile/presentation/screen/change_password/change_password.dart';
import 'package:ticketban_mobile/presentation/screen/home/home.dart';
import 'package:ticketban_mobile/presentation/screen/list_ticket/list_ticket_screen.dart';

class AppRoute {
  final getIt = GetIt.instance;
  late final AuthBloc _authBloc =
      AuthBloc(authRepository: getIt<AuthRepository>())
        ..add(AuthLoginStarted());

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider.value(
              value: _authBloc,
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: LoginScreen(),
              ),
            );
          },
        );
      case RegisterScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider.value(
              value: _authBloc,
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: RegisterScreen(),
              ),
            );
          },
        );
      case ForgetPasswordScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider.value(
              value: _authBloc,
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: ForgetPasswordScreen(),
              ),
            );
          },
        );
      case OtpScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider.value(
              value: _authBloc,
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: OtpScreen(
                  title: AuthOtp.title,
                  desc: AuthOtp.desc,
                ),
              ),
            );
          },
        );
      case '/otp-forget-password':
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider.value(
              value: _authBloc,
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: OtpScreen(
                  title: AuthForgetPasswordOtp.title,
                  desc: AuthForgetPasswordOtp.desc,
                ),
              ),
            );
          },
        );
      case HomeScreen.route:
        return MaterialPageRoute(builder: (context) {
          return const Directionality(
            textDirection: TextDirection.rtl,
            child: HomeScreen(),
          );
        });
      case ChangePasswordScreen.route:
        return MaterialPageRoute(builder: (context) {
          return const Directionality(
            textDirection: TextDirection.rtl,
            child: ChangePasswordScreen(),
          );
        });
      case AddNewTicketScreen.route:
        return MaterialPageRoute(builder: (context) {
          return const Directionality(
            textDirection: TextDirection.rtl,
            child: AddNewTicketScreen(),
          );
        });
      case ListTicketScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return const Directionality(
              textDirection: TextDirection.rtl,
              child: ListTicketScreen(),
            );
          },
        );
      default:
        throw Exception('root is not valid');
    }
  }

  void dispose() {
    _authBloc.close();
  }
}

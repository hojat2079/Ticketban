import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';
import 'package:ticketban_mobile/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:ticketban_mobile/presentation/screen/auth/forget_password_screen.dart';
import 'package:ticketban_mobile/presentation/screen/auth/login_screen.dart';
import 'package:ticketban_mobile/presentation/screen/auth/otp_screen.dart';
import 'package:ticketban_mobile/presentation/screen/auth/register_screen.dart';
import 'package:ticketban_mobile/presentation/screen/change_password/change_password.dart';
import 'package:ticketban_mobile/presentation/screen/home/home.dart';
import 'package:ticketban_mobile/presentation/screen/splash.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/add_ticket/add_ticket_screen.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/list_ticket_screen.dart';

class AppRoute {
  final getIt = GetIt.instance;
  late final AuthBloc _authBloc =
      AuthBloc(authRepository: getIt<AuthRepository>())
        ..add(AuthLoginStarted());

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      //splash screen
      case SplashScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return const Directionality(
              textDirection: TextDirection.rtl,
              child: SplashScreen(),
            );
          },
        );

      //login screen
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

      //register screen
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

      //forget password screen
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

      //otp screen after register screen
      case OtpScreen.routeAfterRegister:
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

      //otp screen after forgetPassword screen
      case OtpScreen.routeAfterForgetPassword:
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

      //home screen
      case HomeScreen.route:
        return MaterialPageRoute(builder: (context) {
          return const Directionality(
            textDirection: TextDirection.rtl,
            child: HomeScreen(),
          );
        });

      //changePassword screen
      case ChangePasswordScreen.route:
        return MaterialPageRoute(builder: (context) {
          return const Directionality(
            textDirection: TextDirection.rtl,
            child: ChangePasswordScreen(),
          );
        });

      //newTicket Screen
      case AddNewTicketScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return const Directionality(
              textDirection: TextDirection.rtl,
              child: AddNewTicketScreen(),
            );
          },
        );

      //listTicket screen
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

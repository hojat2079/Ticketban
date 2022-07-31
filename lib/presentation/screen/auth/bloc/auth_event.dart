part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthStarted extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthRegisterButtonClickedInLoginPage extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthRegisterClicked extends AuthEvent {
  final String name;
  final String password;
  final String phone;

  const AuthRegisterClicked({
    required this.name,
    required this.password,
    required this.phone,
  });

  @override
  List<Object> get props => [name, password, phone];
}

class AuthForgetPasswordClicked extends AuthEvent {
  const AuthForgetPasswordClicked();

  @override
  List<Object> get props => [];
}

class AuthLoginClicked extends AuthEvent {
  final String password;
  final String phone;

  const AuthLoginClicked({
    required this.password,
    required this.phone,
  });

  @override
  List<Object> get props => [password, phone];
}

class AuthOtpClicked extends AuthEvent {
  final String otp;

  const AuthOtpClicked(this.otp);

  @override
  List<Object> get props => [otp];
}

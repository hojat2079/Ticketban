part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthLogin extends AuthState {
  @override
  List<Object> get props => [];

  const AuthLogin();
}

class AuthRegister extends AuthState {
  @override
  List<Object> get props => [];

  const AuthRegister();
}

class AuthForgetPassword extends AuthState {
  const AuthForgetPassword();

  @override
  List<Object> get props => [];
}

class AuthForgetPasswordOtp extends AuthState {
  static const title = 'فراموشی رمز عبور';
  static const desc = 'کد دریافتی را جهت  بازیابی رمز عبور وارد کنید';

  @override
  List<Object> get props => [];

  const AuthForgetPasswordOtp();
}

class AuthOtp extends AuthState {
  static const String title = 'اعتبارسنجی';
  static const String desc =
      'کد ارسال شده به تلفن خود را جهت اعتبارسنجی وارد کنید';
  static const int startTimer = 120;

  const AuthOtp();

  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  const AuthSuccess();

  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
  final CustomError error;

  const AuthErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object> get props => [];
}

class AuthDecreaseTimer extends AuthState {
  final int timer;

  const AuthDecreaseTimer(this.timer);

  @override
  List<Object> get props => [timer];
}

class AuthCancelTimer extends AuthState {
  const AuthCancelTimer();

  @override
  List<Object> get props => [];
}

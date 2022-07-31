part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final bool isLogin;

  const AuthState(this.isLogin);
}

class AuthLogin extends AuthState {
  @override
  List<Object> get props => [];

  const AuthLogin() : super(true);
}

class AuthRegister extends AuthState {
  @override
  List<Object> get props => [];

  const AuthRegister() : super(false);
}

class AuthForgetPassword extends AuthState {
  const AuthForgetPassword() : super(false);

  @override
  List<Object> get props => [];
}

class AuthForgetPasswordOtp extends AuthState {
  static const title = 'فراموشی رمز عبور';
  static const desc = 'کد دریافتی را جهت  بازیابی رمز عبور وارد کنید';

  @override
  List<Object> get props => [];

  const AuthForgetPasswordOtp() : super(false);
}

class AuthOtp extends AuthState {
  static const title = 'اعتبارسنجی';
  static const desc = 'کد ارسال شده به تلفن خود را جهت اعتبارسنجی وارد کنید';

  const AuthOtp() : super(false);

  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  const AuthSuccess() : super(false);

  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
  final CustomError error;

  const AuthErrorState(this.error, super.isLogin);

  @override
  List<Object> get props => [error];
}

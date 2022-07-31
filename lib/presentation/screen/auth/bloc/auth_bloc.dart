import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/data/remote/dto/login_request.dart';
import 'package:ticketban_mobile/data/remote/dto/register_request.dart';
import 'package:ticketban_mobile/data/remote/util/server_error.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const AuthLogin()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthStarted) {
        emitLoginStateWithAuthStarted(emit);
      } else if (event is AuthRegisterButtonClickedInLoginPage) {
        emitRegisterStateWithAuthRegisterButtonClickedInLoginPage(emit);
      } else if (event is AuthRegisterClicked) {
        await emitOtpStateWithAuthRegisterClicked(
            emit, event.name, event.password, event.phone);
      } else if (event is AuthLoginClicked) {
        await emitSuccessStateWithAuthLoginClicked(
            emit, event.password, event.phone);
      } else if (event is AuthOtpClicked) {
        await emitSuccessStateWithAuthOtpClicked(emit, event.otp);
      } else if (event is AuthForgetPasswordClicked) {
        emitForgetPasswordStateWithForgetButtonClicked(emit);
      }
    });
  }

  void emitLoginStateWithAuthStarted(Emitter<AuthState> emit) {
    emit(const AuthLogin());
  }

  void emitRegisterStateWithAuthRegisterButtonClickedInLoginPage(
    Emitter<AuthState> emit,
  ) {
    emit(const AuthRegister());
  }

  void emitForgetPasswordStateWithForgetButtonClicked(Emitter<AuthState> emit) {
    emit(const AuthForgetPassword());
  }

  Future<void> emitOtpStateWithAuthRegisterClicked(
    Emitter<AuthState> emit,
    String name,
    String password,
    String phone,
  ) async {
    try {
      await authRepository.register(RegisterRequest.withPhone(
        familyName: name.split(' ')[1],
        password: password,
        name: name.split(' ')[0],
        phoneNumber: phone,
      ));
      emit(const AuthOtp());
    } catch (ex) {
      emit(AuthErrorState(ex is CustomError ? ex : CustomError(), false));
    }
  }

  Future<void> emitSuccessStateWithAuthLoginClicked(
    Emitter<AuthState> emit,
    String password,
    String phone,
  ) async {
    try {
      await authRepository.login(LoginRequest.withPhone(
        password: password,
        phoneNumber: phone,
      ));
      emit(const AuthSuccess());
    } catch (ex) {
      emit(AuthErrorState(ex is CustomError ? ex : CustomError(), true));
    }
  }

  Future<void> emitSuccessStateWithAuthOtpClicked(
    Emitter<AuthState> emit,
    String otp,
  ) async {
    try {
      await authRepository.verifyOtp(otp);
      emit(const AuthSuccess());
    } catch (ex) {
      emit(AuthErrorState(ex is CustomError ? ex : CustomError(), false));
    }
  }
}

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
  int _currentTime = 120;

  AuthBloc({required this.authRepository}) : super(const AuthLogin()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthLoginStarted) {
        //start login page
        emitLoginStateWithAuthStarted(emit);
      } else if (event is AuthRegisterButtonClickedInLoginPage) {
        //click register button in login page
        emitRegisterStateWithAuthRegisterButtonClickedInLoginPage(emit);
      } else if (event is AuthLoginButtonClickedInRegisterPage) {
        //click login button in register page
        emitLoginStateWithAuthStarted(emit);
      } else if (event is AuthRegisterClicked) {
        //submit register button
        await emitOtpStateWithAuthRegisterClicked(
            emit, event.name, event.password, event.phone);
      } else if (event is AuthLoginClicked) {
        //submit login button
        await emitSuccessStateWithAuthLoginClicked(
            emit, event.password, event.phone);
      } else if (event is AuthOtpClicked) {
        //submit confirmOtp button
        await emitSuccessStateWithAuthOtpClicked(emit, event.otp);
      } else if (event is AuthForgetPasswordClicked) {
        //click forgetPassword button in login page
        emitForgetPasswordStateWithForgetButtonClicked(emit);
      } else if (event is AuthAfterOneSecond) {
        //decrease time in otp screen
        emitDecreaseTimerWithAfterOneSecond(emit);
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
      //emit loading state
      emit(const AuthLoading());
      await authRepository.register(RegisterRequest.withPhone(
        familyName: name.split(' ')[1],
        password: password,
        name: name.split(' ')[0],
        phoneNumber: phone,
      ));
      //emit success state and navigate to otp page
      emit(const AuthOtp());
    } catch (ex) {
      //emit error state and show snackbar
      emit(AuthErrorState(ex is CustomError ? ex : CustomError()));
    }
  }

  Future<void> emitSuccessStateWithAuthLoginClicked(
    Emitter<AuthState> emit,
    String password,
    String phone,
  ) async {
    try {
      //emit loading state
      emit(const AuthLoading());
      await authRepository.login(LoginRequest.withPhone(
        password: password,
        phoneNumber: phone,
      ));
      //emit success state and navigate to home page
      emit(const AuthSuccess());
    } catch (ex) {
      //emit error state and show snackbar
      emit(AuthErrorState(ex is CustomError ? ex : CustomError()));
    }
  }

  Future<void> emitSuccessStateWithAuthOtpClicked(
    Emitter<AuthState> emit,
    String otp,
  ) async {
    try {
      //emit loading state
      emit(const AuthLoading());
      final result = await authRepository.verifyOtp(otp);
      if (result) {
        //emit success state and navigate to home screen
        emit(const AuthSuccess());
      }
    } catch (ex) {
      //emit error state and show snackbar
      emit(AuthErrorState(ex is CustomError ? ex : CustomError()));
    }
  }

  void emitDecreaseTimerWithAfterOneSecond(Emitter<AuthState> emit) {
    if (_currentTime == 0) {
      //emit cancel state and show again button
      emit(const AuthCancelTimer());
    } else {
      _currentTime--;
      //emit decrease state in decrease 1 second timer
      emit(AuthDecreaseTimer(_currentTime));
    }
  }
}

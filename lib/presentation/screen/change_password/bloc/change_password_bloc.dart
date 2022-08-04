import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketban_mobile/data/remote/util/server_error.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';

part 'change_password_event.dart';

part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final AuthRepository authRepository;

  ChangePasswordBloc(this.authRepository) : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) async {
      if (event is ChangePasswordClickSubmitButton) {
        await submitButtonClickedHandler(
          emit: emit,
          currentPass: event.currentPass,
          newPass: event.newPass,
          confirmNewPass: event.confirmNewPass,
        );
      }
    });
  }

  Future<void> submitButtonClickedHandler({
    required Emitter<ChangePasswordState> emit,
    required String currentPass,
    required String newPass,
    required String confirmNewPass,
  }) async {
    try {
      emit(ChangePasswordLoading());

      //check same newPassword
      if (!checkConfirmNewPassword(newPass, confirmNewPass)) {
        emit(
          ChangePasswordError(
            CustomError(message: 'تکرار رمزعبور با رمزعبور یکسان نیست'),
          ),
        );
        return;
      }

      final result = await authRepository.changePassword(currentPass, newPass);

      //error response server
      if (!result) {
        emit(
          ChangePasswordError(
            CustomError(message: 'مشکلی بوجود آمد'),
          ),
        );
        return;
      }

      emit(ChangePasswordSuccess());
    } catch (ex) {
      emit(
        ChangePasswordError(
          ex is CustomError ? ex : CustomError(message: 'مشکلی بوجود آمد'),
        ),
      );
    }
  }

  bool checkConfirmNewPassword(String newPass, String confirmPass) {
    return newPass == confirmPass;
  }
}

part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordStarted extends ChangePasswordEvent {}

class ChangePasswordClickSubmitButton extends ChangePasswordEvent {
  final String currentPass;
  final String newPass;
  final String confirmNewPass;

  const ChangePasswordClickSubmitButton({
    required this.currentPass,
    required this.newPass,
    required this.confirmNewPass,
  });

  @override
  List<Object> get props => [currentPass, newPass, confirmNewPass];
}

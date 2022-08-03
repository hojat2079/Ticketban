part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeStarted extends HomeEvent {}

class HomeExitButtonClicked extends HomeEvent {
  final bool exit;

  const HomeExitButtonClicked(this.exit);

  @override
  List<Object> get props => [exit];
}

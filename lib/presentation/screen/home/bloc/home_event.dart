part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeStarted extends HomeEvent {}

class HomeExitButtonClicked extends HomeEvent {
  const HomeExitButtonClicked();

  @override
  List<Object> get props => [];
}

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  final String username;

  const HomeSuccess(this.username);

  @override
  List<Object> get props => [];
}

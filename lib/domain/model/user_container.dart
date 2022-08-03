import 'package:equatable/equatable.dart';

class UserContainer extends Equatable {
  String? name;
  String? username;

  static UserContainer? _instance;

  UserContainer._singleton();

  static UserContainer instance() {
    _instance ??= UserContainer._singleton();
    return _instance!;
  }

  void clear() {
    name = '';
    username = '';
  }

  @override
  List<Object?> get props => [name, username];
}

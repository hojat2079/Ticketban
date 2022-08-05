import 'package:equatable/equatable.dart';

class TokenContainer extends Equatable {
  String? accessToken;
  String? refreshToken;
  String? verificationId;
  String? userId;

  static TokenContainer? _instance;

  TokenContainer._singleton();

  static TokenContainer instance() {
    _instance ??= TokenContainer._singleton();
    return _instance!;
  }

  void clear() {
    accessToken = '';
    refreshToken = '';
    userId = '';
  }

  @override
  List<Object?> get props => [accessToken, refreshToken];
}

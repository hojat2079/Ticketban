import 'package:equatable/equatable.dart';

class TokenContainer extends Equatable {
  String? accessToken;
  String? refreshToken;
  String? verificationId;

  static TokenContainer? _instance;

  TokenContainer._singleton();

  static TokenContainer instance() {
    _instance ??= TokenContainer._singleton();
    return _instance!;
  }

  @override
  List<Object?> get props => [accessToken, refreshToken];
}

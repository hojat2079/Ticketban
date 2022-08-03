import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable {
  final String token;
  final String refreshToken;
  final String? userId;
  final String? verificationId;

  const AuthResponse(
      this.token, this.refreshToken, this.userId, this.verificationId);

  @override
  List<Object?> get props => [token, refreshToken, userId, verificationId];

  AuthResponse.fromJson(Map<String, dynamic> json)
      : token = json['accessToken'],
        refreshToken = json['refreshToken'],
        userId = json['userId'],
        verificationId = json['verificationId'];
}

import 'package:equatable/equatable.dart';
import 'package:ticketban_mobile/data/remote/dto/auth_method.dart';

class LoginRequest extends Equatable {
  final String? phoneNumber;
  final String password;
  final AuthMethod method;
  final String? email;

  const LoginRequest.withPhone({
    required this.phoneNumber,
    required this.password,
  })  : method = AuthMethod.phone,
        email = null;

  const LoginRequest.withEmail({
    required this.email,
    required this.password,
  })  : method = AuthMethod.email,
        phoneNumber = null;

  @override
  List<Object?> get props => [
        phoneNumber,
        password,
        method,
        email,
      ];

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'identifier': AuthMethod.email == method ? email : phoneNumber,
    };
  }
}

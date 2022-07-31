import 'package:equatable/equatable.dart';
import 'package:ticketban_mobile/data/remote/dto/auth_method.dart';

class RegisterRequest extends Equatable {
  final String? phoneNumber;
  final String? email;
  final String password;
  final String name;
  final String familyName;
  final AuthMethod method;

  const RegisterRequest.withPhone({
    required this.familyName,
    required this.password,
    required this.name,
    required this.phoneNumber,
  })  : email = null,
        method = AuthMethod.phone;

  const RegisterRequest.withEmail({
    required this.familyName,
    required this.password,
    required this.name,
    required this.email,
  })  : phoneNumber = null,
        method = AuthMethod.email;

  @override
  List<Object?> get props => [
        phoneNumber,
        password,
        name,
        familyName,
        email,
        method,
      ];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'method': AuthMethod.email.name,
      'familyName': familyName,
      'identifier': AuthMethod.email == method ? email : phoneNumber,
      'password': password,
    };
  }
}

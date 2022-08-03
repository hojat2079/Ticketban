import 'package:ticketban_mobile/data/remote/dto/auth_response.dart';
import 'package:ticketban_mobile/data/remote/dto/login_request.dart';
import 'package:ticketban_mobile/data/remote/dto/register_request.dart';
import 'package:ticketban_mobile/domain/model/token_container.dart';

abstract class AuthRepository {
  Future<void> register(RegisterRequest registerRequest);

  Future<void> login(LoginRequest loginRequest);

  Future<bool> verifyOtp(String otp);

  Future<bool> saveTokenToDb(String token, String refreshToken);

  Future<void> loadTokenFromDb();
}

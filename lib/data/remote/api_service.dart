import 'package:ticketban_mobile/data/remote/dto/auth_response.dart';
import 'package:ticketban_mobile/data/remote/dto/login_request.dart';
import 'package:ticketban_mobile/data/remote/dto/register_request.dart';

abstract class ApiService {
  Future<AuthResponse> register(RegisterRequest registerRequest);

  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<bool> verifyOtp(String otp, String verificationId);

// Future<void> forgetPassword();
}

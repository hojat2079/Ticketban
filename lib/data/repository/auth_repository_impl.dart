import 'package:ticketban_mobile/data/remote/api_service.dart';
import 'package:ticketban_mobile/data/remote/dto/auth_response.dart';
import 'package:ticketban_mobile/data/remote/dto/login_request.dart';
import 'package:ticketban_mobile/data/remote/dto/register_request.dart';
import 'package:ticketban_mobile/domain/model/token_container.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService;
  final TokenContainer token = TokenContainer.instance();

  AuthRepositoryImpl(this.apiService);

  @override
  Future<void> loadTokenFromDb() {
    // TODO: implement loadTokenFromDb
    throw UnimplementedError();
  }

  @override
  Future<void> login(LoginRequest loginRequest) async {
    final AuthResponse response = await apiService.login(loginRequest);
    token.accessToken = response.token;
    token.refreshToken = response.refreshToken;
  }

  @override
  Future<void> register(RegisterRequest registerRequest) async {
    final AuthResponse response = await apiService.register(registerRequest);
    token.accessToken = response.token;
    token.refreshToken = response.refreshToken;
    token.verificationId = response.verificationId;
  }

  @override
  Future<bool> saveTokenToDb(TokenContainer tokenHolder) {
    // TODO: implement saveTokenToDb
    throw UnimplementedError();
  }

  @override
  Future<void> verifyOtp(String otp) {
    return apiService.verifyOtp(
      otp,
      token.verificationId!,
    );
  }
}

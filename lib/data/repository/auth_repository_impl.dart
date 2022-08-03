import 'package:ticketban_mobile/data/local/app_prefernces.dart';
import 'package:ticketban_mobile/data/remote/api_service.dart';
import 'package:ticketban_mobile/data/remote/dto/auth_response.dart';
import 'package:ticketban_mobile/data/remote/dto/login_request.dart';
import 'package:ticketban_mobile/data/remote/dto/register_request.dart';
import 'package:ticketban_mobile/domain/model/token_container.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService;
  final AppPreferences appPreferences;
  final TokenContainer token = TokenContainer.instance();

  AuthRepositoryImpl(this.apiService, this.appPreferences);

  @override
  Future<void> loadTokenFromDb() async {
    final token = await appPreferences.loadToken();
    final refreshToken = await appPreferences.loadRefreshToken();
    final userId = await appPreferences.getUserId();
    TokenContainer.instance().refreshToken = refreshToken;
    TokenContainer.instance().accessToken = token;
    TokenContainer.instance().userId = userId;
  }

  @override
  Future<void> login(LoginRequest loginRequest) async {
    final AuthResponse response = await apiService.login(loginRequest);
    await saveTokenToDb(response.token, response.refreshToken);
    await appPreferences.setUserId(response.userId!);
    token.userId = response.userId;
  }

  @override
  Future<void> register(RegisterRequest registerRequest) async {
    final AuthResponse response = await apiService.register(registerRequest);
    await saveTokenToDb(response.token, response.refreshToken);
    token.verificationId = response.verificationId;
  }

  @override
  Future<bool> saveTokenToDb(String token, String refreshToken) async {
    final bool resultSaveToken = await appPreferences.saveToken(token);
    final bool resultSaveRefreshToken =
        await appPreferences.saveRefreshToken(refreshToken);
    loadTokenFromDb();
    return resultSaveRefreshToken && resultSaveToken;
  }

  @override
  Future<bool> verifyOtp(String otp) async {
    final bool result = await apiService.verifyOtp(
      otp,
      token.verificationId!,
    );
    if (!result) {
      appPreferences.clear();
      TokenContainer.instance().clear();
    }
    return result;
  }

  @override
  Future<void> clearData() async {
    TokenContainer.instance().clear();
    await appPreferences.clear();
  }
}

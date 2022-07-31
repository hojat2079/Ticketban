import 'package:dio/dio.dart';
import 'package:ticketban_mobile/data/remote/api_service.dart';
import 'package:ticketban_mobile/data/remote/dto/auth_response.dart';
import 'package:ticketban_mobile/data/remote/dto/login_request.dart';
import 'package:ticketban_mobile/data/remote/dto/register_request.dart';
import 'package:ticketban_mobile/data/remote/util/http_validator.dart';
import 'package:ticketban_mobile/domain/model/token_container.dart';
import 'package:ticketban_mobile/util/constant.dart';

class DioApiService with HttpResponseValidator implements ApiService {
  late Dio dio;

  DioApiService(this.dio);

  // {
  //   dio.interceptors.add(
  //     InterceptorsWrapper(onRequest: ((options, handler) async {
  //       final accessToken = TokenContainer.instance().accessToken;
  //       if (accessToken != null && accessToken.isNotEmpty) {
  //         options.headers['Authorization'] = 'Bearer $accessToken';
  //       }
  //       handler.next(options);
  //     }), onError: (error, handler) {
  //       //todo
  //     }),
  //   );
  // }

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    final response = await dio.post(
      Constant.loginUrl,
      data: loginRequest.toMap(),
    );
    validateResponse(response);
    return AuthResponse.fromJson(response.data['data']);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    final response = await dio.post(
      Constant.loginUrl,
      data: registerRequest.toMap(),
    );
    validateResponse(response);
    return AuthResponse.fromJson(response.data['data']);
  }

  @override
  Future<void> verifyOtp(String otp, String verificationId) async {
    final response = await dio.post(
      Constant.loginUrl,
      data: {
        'otp': otp,
        'verificationId': verificationId,
      },
    );
    validateResponse(response);
  }
}

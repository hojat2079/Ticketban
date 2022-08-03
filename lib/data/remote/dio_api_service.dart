import 'package:dio/dio.dart';
import 'package:ticketban_mobile/data/remote/api_service.dart';
import 'package:ticketban_mobile/data/remote/dto/auth_response.dart';
import 'package:ticketban_mobile/data/remote/dto/login_request.dart';
import 'package:ticketban_mobile/data/remote/dto/register_request.dart';
import 'package:ticketban_mobile/data/remote/dto/ticket_request.dart';
import 'package:ticketban_mobile/data/remote/dto/ticket_user_response.dart';
import 'package:ticketban_mobile/data/remote/dto/user_info_response.dart';
import 'package:ticketban_mobile/data/remote/util/http_validator.dart';
import 'package:ticketban_mobile/domain/model/token_container.dart';
import 'package:ticketban_mobile/util/constant.dart';

class DioApiService with HttpResponseValidator implements ApiService {
  late Dio dio;

  DioApiService(this.dio) {
    dio.interceptors.add(
      InterceptorsWrapper(onRequest: ((options, handler) async {
        final accessToken = TokenContainer.instance().accessToken;
        if (accessToken != null && accessToken.isNotEmpty) {
          options.headers['Cookie'] = 'access-token=$accessToken';
        }
        handler.next(options);
      }), onError: (error, handler) {
        //todo
      }),
    );
  }

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
      Constant.registerUrl,
      data: registerRequest.toMap(),
    );
    validateResponse(response);
    return AuthResponse.fromJson(response.data['data']);
  }

  @override
  Future<bool> verifyOtp(String otp, String verificationId) async {
    final response = await dio.post(
      Constant.verifyOtpUrl,
      data: {
        'otp': otp,
        'verificationId': verificationId,
      },
    );
    return validateResponse(response);
  }

  @override
  Future<bool> createTicket(TicketRequest ticketRequest) async {
    final response = await dio.post(
      Constant.createTicket,
      data: ticketRequest.toMap(),
    );
    return validateResponse(response);
  }

  @override
  Future<List<TicketUserDto>> getAllUserTicket() async {
    final response = await dio.get(Constant.getAllTicketUser);
    validateResponse(response);
    final List<TicketUserDto> list = [];
    for (var object in (response.data['data']['arr'] as List)) {
      list.add(TicketUserDto.fromJson(object));
    }
    return list;
  }

  @override
  Future<List<TicketUserDto>> getAllTicketUserFiltered(String status) async {
    final response = await dio.get(
      '${Constant.getAllTicketUserFiltered}/?status=$status',
    );
    validateResponse(response);
    final List<TicketUserDto> list = [];
    for (var object in (response.data['data']['arr'] as List)) {
      list.add(TicketUserDto.fromJson(object));
    }
    return list;
  }

  @override
  Future<bool> deleteTicket(String ticketId) async {
    final response = await dio.delete('${Constant.deleteTicket}/:$ticketId');
    return validateResponse(response);
  }

  @override
  Future<UserInfoResponse> userInfo(String userId) async {
    final response = await dio.post(
      Constant.userInfo,
      data: {"userId": userId},
    );
    validateResponse(response);
    return UserInfoResponse.fromJson(response.data['data']);
  }
}

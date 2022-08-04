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
import 'package:ticketban_mobile/data/remote/util/constant.dart';

class DioApiService with HttpResponseValidator implements ApiService {
  late Dio dio;

  DioApiService(this.dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        //add token to header
        onRequest: (options, handler) async {
          final accessToken = TokenContainer.instance().accessToken;
          if (accessToken != null && accessToken.isNotEmpty) {
            options.headers['Cookie'] = 'access-token=$accessToken';
          }
          handler.next(options);
        },

        //handle refreshToken
        onError: (error, handler) {
          //todo
        },
      ),
    );
  }

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    final response = await dio.post(
      RemoteConstant.loginUrl,
      data: loginRequest.toMap(),
    );
    validateResponse(response);
    return AuthResponse.fromJson(response.data['data']);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    final response = await dio.post(
      RemoteConstant.registerUrl,
      data: registerRequest.toMap(),
    );
    validateResponse(response);
    return AuthResponse.fromJson(response.data['data']);
  }

  @override
  Future<bool> verifyOtp(String otp, String verificationId) async {
    final response = await dio.post(
      RemoteConstant.verifyOtpUrl,
      data: {
        'otp': otp,
        'verificationId': verificationId,
      },
    );
    return validateResponse(response);
  }

  @override
  Future<bool> changePassword(String currentPass, String newPass) async {
    final response = await dio.post(
      RemoteConstant.changePassword,
      data: {
        'currentPassword': currentPass,
        'newPassword': newPass,
        'confirmNewPassword': newPass,
      },
    );
    return validateResponse(response);
  }

  @override
  Future<bool> createTicket(TicketRequest ticketRequest) async {
    final response = await dio.post(
      RemoteConstant.createTicket,
      data: ticketRequest.toMap(),
    );
    return validateResponse(response);
  }

  @override
  Future<List<TicketUserDto>> getAllUserTicket() async {
    final response = await dio.get(RemoteConstant.getAllTicketUser);
    validateResponse(response);

    //result to this list
    final List<TicketUserDto> list = [];

    for (var object in (response.data['data']['arr'] as List)) {
      list.add(TicketUserDto.fromJson(object[0]));
    }
    return list;
  }

  @override
  Future<List<TicketUserDto>> getAllTicketUserFiltered(String status) async {
    final response = await dio.get(
      '${RemoteConstant.getAllTicketUserFiltered}/?status=$status',
    );
    validateResponse(response);

    //result to this list
    final List<TicketUserDto> list = [];

    for (var object in (response.data['data']['arr'] as List)) {
      list.add(TicketUserDto.fromJson(object));
    }
    return list;
  }

  @override
  Future<bool> deleteTicket(String ticketId) async {
    final response =
        await dio.delete('${RemoteConstant.deleteTicket}/:$ticketId');
    return validateResponse(response);
  }

  @override
  Future<UserInfoResponse> userInfo(String userId) async {
    final response = await dio.post(
      RemoteConstant.userInfo,
      data: {"userId": userId},
    );
    validateResponse(response);
    return UserInfoResponse.fromJson(response.data['data']);
  }
}

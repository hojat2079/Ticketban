import 'package:dio/dio.dart';
import 'package:ticketban_mobile/data/remote/util/server_error.dart';

class HttpResponseValidator {
  bool validateResponse(Response response) {
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      throw CustomError(
        errorCode: response.statusCode ?? 500,
        message: (response.data as Map<String, dynamic>)['message'] ??
            response.statusMessage ??
            'خطای نامشخص',
      );
    }
  }
}

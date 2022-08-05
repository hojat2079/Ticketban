class RemoteConstant {
  //api
  static const String baseUrl = 'http://10.0.2.2:5000/api/v1/';

  //auth
  static const String loginUrl = 'auth/login';
  static const String registerUrl = 'auth/register';
  static const String verifyOtpUrl = 'auth/verify-otp';
  static const String changePassword = 'auth/change-password';
  static const String refreshToken = 'auth/refresh-token';

  //ticket
  static const String createTicket = 'user/create-ticket';
  static const String getAllTicketUser = 'user/get-user-tickets';
  static const String getAllTicketUserFiltered = 'user/filter-user-tickets';
  static const String deleteTicket = 'user/delete-ticket';
  static const String userInfo = 'user/user_info';

  RemoteConstant._();
}

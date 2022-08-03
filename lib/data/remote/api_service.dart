import 'package:ticketban_mobile/data/remote/dto/auth_response.dart';
import 'package:ticketban_mobile/data/remote/dto/login_request.dart';
import 'package:ticketban_mobile/data/remote/dto/register_request.dart';
import 'package:ticketban_mobile/data/remote/dto/ticket_request.dart';
import 'package:ticketban_mobile/data/remote/dto/ticket_user_response.dart';

abstract class ApiService {
  //auth
  Future<AuthResponse> register(RegisterRequest registerRequest);

  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<bool> verifyOtp(String otp, String verificationId);

  // Future<void> forgetPassword();

  //ticket
  Future<bool> createTicket(TicketRequest ticketRequest);

  Future<List<TicketUserDto>> getAllUserTicket();

  Future<List<TicketUserDto>> getAllTicketUserFiltered(String status);

  Future<bool> deleteTicket(String ticketId);
}

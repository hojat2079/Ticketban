import 'package:ticketban_mobile/data/remote/dto/ticket_request.dart';
import 'package:ticketban_mobile/data/remote/dto/ticket_user_response.dart';
import 'package:ticketban_mobile/data/remote/dto/user_info_response.dart';

abstract class TicketUserRepository {
  Future<bool> createTicket(TicketRequest ticketRequest);

  Future<List<TicketUserDto>> getAllUserTicket();

  Future<List<TicketUserDto>> getAllTicketUserFiltered(String status);

  Future<bool> deleteTicket(String ticketId);

  Future<UserInfoResponse> userInfo(String userId);
}

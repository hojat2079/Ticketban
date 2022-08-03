import 'package:ticketban_mobile/data/remote/api_service.dart';
import 'package:ticketban_mobile/data/remote/dto/ticket_request.dart';
import 'package:ticketban_mobile/data/remote/dto/ticket_user_response.dart';
import 'package:ticketban_mobile/domain/repository/ticket_user_repository.dart';

class TicketUserRepositoryImpl implements TicketUserRepository {
  final ApiService apiService;

  TicketUserRepositoryImpl(this.apiService);

  @override
  Future<bool> createTicket(TicketRequest ticketRequest) {
    return apiService.createTicket(ticketRequest);
  }

  @override
  Future<List<TicketUserDto>> getAllUserTicket() {
    return apiService.getAllUserTicket();
  }

  @override
  Future<List<TicketUserDto>> getAllTicketUserFiltered(String status) {
    return apiService.getAllTicketUserFiltered(status);
  }

  @override
  Future<bool> deleteTicket(String ticketId) {
    return apiService.deleteTicket(ticketId);
  }
}

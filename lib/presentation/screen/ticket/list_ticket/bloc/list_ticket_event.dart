part of 'list_ticket_bloc.dart';

abstract class ListTicketEvent extends Equatable {
  const ListTicketEvent();

  @override
  List<Object> get props => [];
}

class ListTicketStarted extends ListTicketEvent {}

class ListTicketChangeStatus extends ListTicketEvent {
  final String status;
  final int index;

  const ListTicketChangeStatus({
    required this.status,
    required this.index,
  });

  @override
  List<Object> get props => [status, index];
}

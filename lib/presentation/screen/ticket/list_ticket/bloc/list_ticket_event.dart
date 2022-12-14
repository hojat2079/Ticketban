part of 'list_ticket_bloc.dart';

abstract class ListTicketEvent extends Equatable {
  const ListTicketEvent();

  @override
  List<Object> get props => [];
}

class ListTicketStarted extends ListTicketEvent {
  final bool isRefresh;

  const ListTicketStarted({this.isRefresh = false});

  @override
  List<Object> get props => [isRefresh];
}

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

class ListTicketClickDeleteTicketButton extends ListTicketEvent {
  final String ticketId;

  @override
  List<Object> get props => [ticketId];

  const ListTicketClickDeleteTicketButton(this.ticketId);
}

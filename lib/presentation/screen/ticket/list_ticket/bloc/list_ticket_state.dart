part of 'list_ticket_bloc.dart';

abstract class ListTicketState extends Equatable {
  const ListTicketState();

  @override
  List<Object> get props => [];
}

class ListTicketLoading extends ListTicketState {}

class ListTicketSuccess extends ListTicketState {
  final List<TicketUserModel> tickets;
  final int sizeAllTickets;
  final int sizeAnsweredTickets;
  final int sizePendingTickets;
  final int selectedIndexToggleMenu;

  const ListTicketSuccess(
      {required this.tickets,
      required this.sizeAllTickets,
      required this.sizeAnsweredTickets,
      required this.sizePendingTickets,
      required this.selectedIndexToggleMenu});

  @override
  List<Object> get props => [
        tickets,
        sizeAllTickets,
        sizeAnsweredTickets,
        sizePendingTickets,
      ];
}

class ListTicketError extends ListTicketState {
  final CustomError error;

  const ListTicketError(this.error);

  @override
  List<Object> get props => [error];
}

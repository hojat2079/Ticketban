part of 'add_ticket_bloc.dart';

abstract class AddTicketState extends Equatable {
  const AddTicketState();
}

class AddTicketInitial extends AddTicketState {
  @override
  List<Object> get props => [];
}

class AddTicketError extends AddTicketState {
  final CustomError error;

  const AddTicketError(this.error);

  @override
  List<Object> get props => [error];
}

class AddTicketLoading extends AddTicketState {
  @override
  List<Object> get props => [];
}

class AddTicketCreated extends AddTicketState {
  const AddTicketCreated();

  @override
  List<Object> get props => [];
}

class AddTicketSetNewType extends AddTicketState {
  final String value;

  const AddTicketSetNewType(this.value);

  @override
  List<Object> get props => [value];
}

part of 'add_ticket_bloc.dart';

abstract class AddTicketEvent extends Equatable {
  const AddTicketEvent();

  @override
  List<Object> get props => [];
}

class AddTicketStarted extends AddTicketEvent {}

class AddTicketSubmitButtonClicked extends AddTicketEvent {
  final String title;
  final String desc;
  final String type;

  @override
  List<Object> get props => [title, desc, type];

  const AddTicketSubmitButtonClicked(this.title, this.desc, this.type);
}

class AddTicketChangeTypeState extends AddTicketEvent {
  final String type;

  @override
  List<Object> get props => [type];

  const AddTicketChangeTypeState(this.type);
}

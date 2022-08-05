import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketban_mobile/data/remote/dto/ticket_user_response.dart';
import 'package:ticketban_mobile/data/remote/util/server_error.dart';
import 'package:ticketban_mobile/domain/model/ticket_user.dart';
import 'package:ticketban_mobile/domain/repository/ticket_user_repository.dart';

part 'list_ticket_event.dart';

part 'list_ticket_state.dart';

const allTicketsIndex = 1;
const pendingTicketsIndex = 0;
const answeredTicketsIndex = 2;

class ListTicketBloc extends Bloc<ListTicketEvent, ListTicketState> {
  final TicketUserRepository repository;
  late List<TicketUserModel> allTickets;
  late List<TicketUserModel> pendingTickets;
  late List<TicketUserModel> answeredTickets;

  ListTicketBloc(this.repository) : super(ListTicketLoading()) {
    on<ListTicketEvent>(
      (event, emit) async {
        if (event is ListTicketStarted) {
          await handleStartedEvent(emit);
        } else if (event is ListTicketChangeStatus) {
          await handleChangeStatus(emit, event.index);
        }
      },
    );
  }

  Future<void> handleStartedEvent(Emitter<ListTicketState> emit) async {
    try {
      emit(ListTicketLoading());

      //getAllTicket
      allTickets = await repository
          .getAllUserTicket()
          .then((value) => value.map((e) => e.toTicketUserModel()).toList());
      pendingTickets = await repository
          .getAllTicketUserFiltered('pending')
          .then((value) => value.map((e) => e.toTicketUserModel()).toList());

      answeredTickets = await repository
          .getAllTicketUserFiltered('answered')
          .then((value) => value.map((e) => e.toTicketUserModel()).toList());

      //emit state
      emit(ListTicketSuccess(
          tickets: allTickets,
          sizePendingTickets: pendingTickets.length,
          sizeAllTickets: allTickets.length,
          sizeAnsweredTickets: answeredTickets.length,
          selectedIndexToggleMenu: allTicketsIndex));
    } catch (ex) {
      emit(
        ListTicketError(
          ex is CustomError ? ex : CustomError(message: 'خطای نامشخص'),
        ),
      );
    }
  }

  Future<void> handleChangeStatus(
      Emitter<ListTicketState> emit, int index) async {
    final List<TicketUserModel> resultList = index == allTicketsIndex
        ? allTickets
        : index == pendingTicketsIndex
            ? pendingTickets
            : answeredTickets;
    //emit state
    emit(ListTicketSuccess(
        tickets: resultList,
        sizePendingTickets: pendingTickets.length,
        sizeAllTickets: allTickets.length,
        sizeAnsweredTickets: answeredTickets.length,
        selectedIndexToggleMenu: index));
  }
}

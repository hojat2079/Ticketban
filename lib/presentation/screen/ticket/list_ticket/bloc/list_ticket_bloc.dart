import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late int currentIndex;

  ListTicketBloc(this.repository) : super(ListTicketLoading()) {
    on<ListTicketEvent>(
      (event, emit) async {
        if (event is ListTicketStarted) {
          await handleStartedEvent(emit);
        } else if (event is ListTicketChangeStatus) {
          await handleChangeStatus(emit, event.index);
        } else if (event is ListTicketClickDeleteTicketButton) {
          await handleDeleteTask(emit, event.ticketId);
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

      //current index
      currentIndex = allTicketsIndex;

      //emit state
      emit(ListTicketSuccess(
          tickets: allTickets,
          sizePendingTickets: pendingTickets.length,
          sizeAllTickets: allTickets.length,
          sizeAnsweredTickets: answeredTickets.length,
          selectedIndexToggleMenu: currentIndex));
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
    //current index
    currentIndex = index;

    //emit state
    emit(ListTicketSuccess(
        tickets: resultList,
        sizePendingTickets: pendingTickets.length,
        sizeAllTickets: allTickets.length,
        sizeAnsweredTickets: answeredTickets.length,
        selectedIndexToggleMenu: currentIndex));
  }

  Future<void> handleDeleteTask(
      Emitter<ListTicketState> emit, String ticketId) async {
    try {
      emit(ListTicketLoadingDeleteTask(ticketId));

      //check currentTab
      final List<TicketUserModel> resultList =
          currentIndex == allTicketsIndex ? allTickets : pendingTickets;

      //request for delete item
      final resultDeleteItem = await repository.deleteTicket(ticketId);

      if (resultDeleteItem) {
        //remove in list
        allTickets.removeWhere((element) => element.id == ticketId);
        pendingTickets.removeWhere((element) => element.id == ticketId);

        //emit success
        emit(ListTicketSuccess(
            tickets: resultList,
            sizePendingTickets: pendingTickets.length,
            sizeAllTickets: allTickets.length,
            sizeAnsweredTickets: answeredTickets.length,
            selectedIndexToggleMenu: currentIndex));
      }
    } catch (ex) {
      emit(
        ListTicketError(
          ex is CustomError ? ex : CustomError(message: 'خطای نامشخص'),
        ),
      );
    }
  }
}

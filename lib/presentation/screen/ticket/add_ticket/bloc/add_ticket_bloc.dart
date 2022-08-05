import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/data/remote/dto/ticket_request.dart';
import 'package:ticketban_mobile/data/remote/util/server_error.dart';
import 'package:ticketban_mobile/domain/repository/ticket_user_repository.dart';

part 'add_ticket_event.dart';

part 'add_ticket_state.dart';

class AddTicketBloc extends Bloc<AddTicketEvent, AddTicketState> {
  final TicketUserRepository ticketUserRepository;

  AddTicketBloc(this.ticketUserRepository) : super(AddTicketInitial()) {
    on<AddTicketEvent>((event, emit) async {
      if (event is AddTicketSubmitButtonClicked) {
        //submit button click
        await emitSuccessStateWithAddTicketSubmitButtonClicked(
            emit, event.title, event.desc, event.type);
      } else if (event is AddTicketChangeTypeState) {
        //change type add ticket
        emit(AddTicketSetNewType(event.type));
      }
    });
  }

  Future<void> emitSuccessStateWithAddTicketSubmitButtonClicked(
      Emitter<AddTicketState> emit,
      String title,
      String desc,
      String type) async {
    try {
      //loading state
      emit(AddTicketLoading());

      //request to add ticket
      final bool result = await ticketUserRepository.createTicket(
        TicketRequest(
          title: title,
          desc: desc,
          type: type,
        ),
      );
      if (result) {
        //success state add ticket
        emit(const AddTicketCreated());
      } else {
        //error state and show snackbar
        emit(AddTicketError(CustomError()));
      }
    } catch (ex) {
      //error state and show snackbar
      emit(AddTicketError(ex is CustomError ? ex : CustomError()));
    }
  }
}

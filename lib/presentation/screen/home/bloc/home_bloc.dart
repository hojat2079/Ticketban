import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketban_mobile/data/remote/dto/user_info_response.dart';
import 'package:ticketban_mobile/domain/model/token_container.dart';
import 'package:ticketban_mobile/domain/repository/ticket_user_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TicketUserRepository ticketUserRepository;

  HomeBloc(this.ticketUserRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        await homeStartedState(emit);
      }
    });
  }

  Future<void> homeStartedState(Emitter<HomeState> emit) async {
    UserInfoResponse info;
    if (TokenContainer.instance().userId != null) {
      final String userId = TokenContainer.instance().userId!;
      info = await ticketUserRepository.userInfo(userId);
    } else {
      info = const UserInfoResponse('کاربر', 'مهمان');
    }
    emit(HomeSuccess(info.toString()));
  }
}

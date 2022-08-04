import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ticketban_mobile/domain/model/ticket_user.dart';
import 'package:ticketban_mobile/domain/repository/ticket_user_repository.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/elevated_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/small_widget.dart';
import 'package:ticketban_mobile/presentation/screen/home/appbar.dart';
import 'package:ticketban_mobile/presentation/screen/home/home_route.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/add_ticket/drop_down.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/bloc/list_ticket_bloc.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/toggle_group/custom_toggle_group.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/unanswared_ticket_item.dart';

class ListTicketScreen extends StatelessWidget {
  static const String route = '/list';
  static const _listTicketPadding =
      56 + (HomeRoute.bottomNavHeight - HomeRoute.bottomNavContainerHeight);
  static const int defaultToggleMenuSelected = 1;

  const ListTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final GetIt instance = GetIt.instance;
    return HomeRoute(
      child: BlocProvider<ListTicketBloc>(
        create: (context) => ListTicketBloc(
          instance<TicketUserRepository>(),
        )..add(ListTicketStarted()),
        child: BlocBuilder<ListTicketBloc, ListTicketState>(
          builder: (context, state) {
            //success state
            if (state is ListTicketSuccess) {
              return _successState(themeData, state);
            }
            //loading state
            else if (state is ListTicketLoading) {
              return _loadingState(themeData);
            }
            //error state
            else if (state is ListTicketError) {
              return _errorState(state);
            } else {
              throw Exception('state is not supported!');
            }
          },
        ),
      ),
    );
  }

  Widget _errorState(ListTicketError state) {
    return Center(
      child: Text(state.error.message),
    );
  }

  Widget _loadingState(ThemeData themeData) {
    return Center(
      child: showLoading(
        themeData.colorScheme.primary,
      ),
    );
  }

  Widget _successState(ThemeData themeData, ListTicketSuccess state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedBoxH24,

        //appbar
        const Padding(
          padding: padding36H,
          child: HomeAppBar(),
        ),

        sizedBoxH48,

        //titleText
        Padding(
          padding: padding32H,
          child: _largeText(themeData, 'تیکت های شما'),
        ),

        sizedBoxH32,

        //toggleGroup
        Padding(
          padding: padding24H,
          child: CustomToggleGroup(
            selectedIndex: state.selectedIndexToggleMenu,
            sizeAnsweredTickets: state.sizeAnsweredTickets,
            sizeAllTickets: state.sizeAllTickets,
            sizePendingTickets: state.sizePendingTickets,
          ),
        ),

        sizedBoxH16,

        //searchTextField
        Padding(
          padding: padding24H,
          child: ElevatedTextField(
            keyboardType: TextInputType.text,
            hint: 'عنوان یا متن مورد نظر خود راجستجو کنید...',
            prefixIcon: Padding(
              padding: padding8L,
              child: Assets.image.svg.search.svg(),
            ),
            topPadding: 0,
            bottomPadding: 0,
            borderRadius: circular14,
          ),
        ),

        sizedBoxH12,

        //list ticket
        Expanded(
          child: _listTickets(state.tickets),
        ),
      ],
    );
  }

  Widget _listTickets(List<TicketUserModel> lists) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: _listTicketPadding),
      itemBuilder: (context, index) {
        final TicketUserModel ticket = lists[index];
        return UnansweredTicketItem(
          ticketTitle: ticket.title,
          ticketType: ticket.type,
          ticketDesc: ticket.desc,
          ticketDate: '۱۳:۴۳                 ۱۲/۰۳/۱۴۰۰',
          ticketTypeColor: DropDownTicketType.colorItems[ticket.type]!,
        );
      },
      itemCount: lists.length,
    );
  }

  Widget _largeText(ThemeData themeData, String text) {
    return Text(
      text,
      style: themeData.textTheme.headline2,
    );
  }
}

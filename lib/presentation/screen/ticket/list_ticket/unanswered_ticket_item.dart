import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/bloc/list_ticket_bloc.dart';
import 'package:ticketban_mobile/util/extension.dart';

class UnansweredTicketItem extends StatelessWidget {
  final String ticketTitle;
  final String ticketId;
  final String ticketType;
  final Color ticketTypeColor;
  final String ticketDesc;
  final String ticketDate;

  const UnansweredTicketItem(
      {Key? key,
      required this.ticketTitle,
      required this.ticketType,
      required this.ticketDesc,
      required this.ticketDate,
      required this.ticketTypeColor,
      required this.ticketId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: padding18,
      margin: const EdgeInsets.only(bottom: 12, top: 12) + padding32H,
      decoration: BoxDecoration(
        color: themeData.colorScheme.surfaceVariant,
        borderRadius: circular16,
        border: Border.all(
          color: const Color(
            0xffE6E6E6,
          ),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: themeData.colorScheme.inverseSurface,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleText(themeData),
          sizedBoxH20,
          _descText(themeData),
          sizedBoxH20,
          Row(
            children: [
              _dateText(themeData),
              const Spacer(),
              _deleteButton(themeData)
            ],
          )
        ],
      ),
    );
  }

  Widget _dateText(ThemeData themeData) {
    return Text(
      ticketDate.toFaNumber(),
      style: themeData.textTheme.caption!.copyWith(
        fontSize: 10,
      ),
    );
  }

  Widget _deleteButton(ThemeData themeData) {
    return Material(
      color: Colors.transparent,
      child: BlocBuilder<ListTicketBloc, ListTicketState>(
        builder: (context, state) {
          return InkWell(
            borderRadius: circular10,
            highlightColor: themeData.colorScheme.error.withOpacity(0.2),
            onTap: () {
              if (state is ListTicketSuccess) {
                context
                    .read<ListTicketBloc>()
                    .add(ListTicketClickDeleteTicketButton(ticketId));
              }
            },
            child:
                (state is ListTicketLoadingDeleteTask && state.id == ticketId)
                    ? SizedBox(
                        width: 36,
                        child: CupertinoActivityIndicator(
                          color: themeData.colorScheme.error.withOpacity(0.5),
                        ),
                      )
                    : Container(
                        padding: padding9H + padding3V,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: themeData.colorScheme.error,
                            width: 0.7,
                          ),
                          borderRadius: circular10,
                        ),
                        child: Row(
                          children: [
                            Assets.image.svg.delete.svg(),
                            sizedBoxW2,
                            Text(
                              'حذف',
                              style: themeData.textTheme.caption!.copyWith(
                                color: themeData.colorScheme.error,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
          );
        },
        buildWhen: (p, c) =>
            (c is ListTicketLoadingDeleteTask || c is ListTicketSuccess),
      ),
    );
  }

  Widget _titleText(ThemeData themeData) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: ticketTitle,
            style: themeData.textTheme.bodyText2!.copyWith(
              color: themeData.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' ($ticketType)',
            style: themeData.textTheme.bodyText2!.copyWith(
              color: ticketTypeColor,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }

  Widget _descText(ThemeData themeData) {
    return Text(
      ticketDesc,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: themeData.textTheme.caption!.copyWith(fontSize: 12),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/elevated_textfield.dart';
import 'package:ticketban_mobile/presentation/screen/home/appbar.dart';
import 'package:ticketban_mobile/presentation/screen/home/home_route.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/toggle_group/custom_toggle_group.dart';
import 'answered_ticket_item.dart';

class ListTicketScreen extends StatelessWidget {
  static const String route = '/list';

  const ListTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return HomeRoute(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxH24,
          const Padding(
            padding: padding36H,
            child: HomeAppBar(),
          ),
          sizedBoxH48,
          Padding(
            padding: padding32H,
            child: _largeText(themeData, 'تیکت های شما'),
          ),
          sizedBoxH32,
          const Padding(
            padding: padding24H,
            child: CustomToggleGroup(),
          ),
          sizedBoxH16,
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                  bottom: 56 +
                      (HomeRoute.bottomNavHeight -
                          HomeRoute.bottomNavContainerHeight)),
              itemBuilder: (context, index) {
                return const AnsweredTicketItem(
                  adminMessage:
                      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و...',
                  ticketTitle: 'بررسی مجدد درخواست',
                  ticketType: 'مالی',
                  ticketDesc:
                      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و...',
                  ticketDate: '۱۳:۴۳                 ۱۲/۰۳/۱۴۰۰',
                  ticketTypeColor: Color(0xffFFC24B),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  Text _largeText(ThemeData themeData, String text) {
    return Text(
      text,
      style: themeData.textTheme.headline2,
    );
  }
}

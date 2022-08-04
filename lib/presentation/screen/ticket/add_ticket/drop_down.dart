import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class DropDownTicketType extends StatelessWidget {
  // List of items in our dropdown menu
  static const List<String> items = [
    'تعیین نوع درخواست...',
    'مالی',
    'عمومی',
    'اداری',
  ];
  static const Map<String, Color> colorItems = {
    'تعیین نوع درخواست...': LightColorPalette.blackTextColor,
    'مالی': LightColorPalette.yellowDropDown,
    'عمومی': LightColorPalette.greenDropDown,
    'اداری': LightColorPalette.purpleDropDown,
  };

  final Function(String) onTap;

  const DropDownTicketType({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: themeData.colorScheme.surfaceVariant,
        border: Border.all(
          color: const Color(
            0xffEAEAEA,
          ),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: themeData.colorScheme.inverseSurface,
            blurRadius: 30,
          )
        ],
        borderRadius: circular18,
      ),
      child: DropdownButtonFormField(
        focusColor: themeData.colorScheme.surfaceVariant,
        dropdownColor: themeData.colorScheme.surfaceVariant,
        borderRadius: circular18,
        isExpanded: true,
        isDense: true,
        icon: const Icon(Icons.arrow_drop_down),
        decoration: InputDecoration(
          filled: true,
          fillColor: themeData.colorScheme.surfaceVariant,
          focusedBorder: const OutlineInputBorder(
            borderRadius: circular18,
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: circular18,
            borderSide: BorderSide.none,
          ),
          isDense: true,
          contentPadding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
            right: 8,
            left: 16,
          ),
          hintText: items[0],
          hintStyle: themeData.textTheme.bodyText2!.apply(
            color: themeData.colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        items: items
            .map(
              (String item) => DropdownMenuItem(
                alignment: Alignment.centerRight,
                enabled: items.first == item ? false : true,
                value: item,
                child: items.first == item
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: themeData.colorScheme.onSurface,
                                ),
                                Text(
                                  item,
                                  textDirection: TextDirection.rtl,
                                  style: themeData.textTheme.bodyText2!.apply(
                                    color: themeData.colorScheme.onSurface
                                        .withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          sizedBoxH12,
                          const Divider(
                            height: 1,
                            color: Color(0xffD2D2D2),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          item,
                          style: themeData.textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorItems[item],
                            fontSize: 16,
                          ),
                        ),
                      ),
              ),
            )
            .toList(),
        onChanged: (String? value) {
          onTap(value!);
        },
      ),
    );
  }
}

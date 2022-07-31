import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/screen/auth/bloc/auth_bloc.dart';

class RegisterContainer extends StatefulWidget {
  static const String headText = 'ثبت نام';

  const RegisterContainer({Key? key}) : super(key: key);

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: themeData.colorScheme.surface,
        borderRadius: circular32,
      ),
      child: Padding(
        padding: padding32H,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBoxH20,
            Text(
              RegisterContainer.headText,
              style: themeData.textTheme.headline4,
            ),
            sizedBoxH24,
            CustomTextField(
              controller: _nameController,
              hint: 'نام و نام خانوادگی',
              prefixIcon: Padding(
                padding: paddingSuffixIcon,
                child: Assets.image.svg.person.svg(),
              ),
            ),
            sizedBoxH16,
            CustomTextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              hint: 'شماره تلفن',
              prefixIcon: Padding(
                padding: paddingSuffixIcon,
                child: Assets.image.svg.phone.svg(),
              ),
              maxLength: 11,
            ),
            sizedBoxH16,
            CustomTextField(
              controller: _passwordController,
              hint: 'رمز عبور',
              isPassword: true,
              prefixIcon: Padding(
                padding: paddingSuffixIcon,
                child: Assets.image.svg.password.svg(),
              ),
              suffixIcon: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Icon(
                  Icons.visibility_off_outlined,
                  color: themeData.colorScheme.onPrimary,
                ),
              ),
            ),
            sizedBoxH24,
            GradiantButton(
              gradient: LightColorPalette.registerButtonTextGradiant,
              onTap: () {
                context.read<AuthBloc>().add(
                      AuthRegisterClicked(
                        name: _nameController.text,
                        password: _passwordController.text,
                        phone: _phoneController.text,
                      ),
                    );
              },
              label: RegisterContainer.headText,
              textStyle: themeData.textTheme.button,
            ),
            sizedBoxH24,
          ],
        ),
      ),
    );
  }
}

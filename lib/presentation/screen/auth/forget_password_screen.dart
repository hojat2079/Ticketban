import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/screen/auth/appbar.dart';
import 'package:ticketban_mobile/presentation/screen/auth/auth_root.dart';
import 'package:ticketban_mobile/presentation/screen/auth/bloc/auth_bloc.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const headText = 'فراموشی رمز عبور';
  static const route = '/forget-password';

  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return AuthRoot(
      appbar: _appBar(context),
      child: _forgetPasswordContainer(size, themeData),
    );
  }

  Widget _forgetPasswordContainer(Size size, ThemeData themeData) {
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

            //title login container
            _titleContainer(themeData),

            sizedBoxH24,

            //description for forget password container
            _descriptionText(),

            sizedBoxH24,

            //phone textField
            CustomTextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              hint: 'شماره تلفن',
              prefixIcon: _startPhoneIcon(),
              maxLength: 11,
            ),
            sizedBoxH36,

            //submit button
            GradiantButton(
              gradient: LightColorPalette.registerButtonTextGradiant,
              onTap: () {},
              label: 'ارسال کد',
              textStyle: themeData.textTheme.button,
            ),
            sizedBoxH24,
          ],
        ),
      ),
    );
  }

  Widget _startPhoneIcon() {
    return Padding(
      padding: paddingSuffixIcon,
      child: Assets.image.svg.phone.svg(width: 24),
    );
  }

  Widget _descriptionText() =>
      const Text('شماره تلفن خود را جهت ارسال کد بازیابی وارد کنید');

  Widget _titleContainer(ThemeData themeData) {
    return Text(
      ForgetPasswordScreen.headText,
      style: themeData.textTheme.headline4,
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBarAuth(
      gradient: LightColorPalette.loginButtonTextGradiant,
      text: 'ورود',
      onTap: () {
        _onTapLoginClicked(context);
      },
    );
  }

  void _onTapLoginClicked(BuildContext context) {
    context.read<AuthBloc>().add(const AuthLoginButtonClickedInRegisterPage());
  }
}

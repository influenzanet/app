import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class RegisterPage extends ScaffoldPage {
  final void Function() onRegister;
  final void Function() onSkip;

  RegisterPage({this.onRegister, this.onSkip})
      : super(titleText: 'Create New Account', scrollable: true, drawer: false);

  @override
  Widget buildBody(BuildContext context, ThemeData themeData) {
    return RegisterForm(onRegister, onSkip);
  }
}

class RegisterForm extends StatefulWidget {
  final void Function() onRegister;
  final void Function() onSkip;

  RegisterForm(this.onRegister, this.onSkip);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  static final _formKey = GlobalKey<FormState>();
  bool _termsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeElements.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Spacer(flex: 10),
            _encouragement(themeData),
            Spacer(flex: 10),
            _inputFields(themeData),
            Spacer(flex: 10),
            _continueButtons(themeData),
          ],
        ),
      ),
    );
  }

  Widget _encouragement(ThemeData themeData) {
    return Text(
      'Only one more step!',
      style: themeData.textTheme.display1,
      textAlign: TextAlign.center,
    );
  }

  Widget _inputFields(ThemeData themeData) {
    return Column(
      children: <Widget>[
        ThemedTextFormField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        Container(height: ThemeElements.connectedElementPadding),
        ThemedTextFormField(
          hintText: 'Password',
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        Container(height: ThemeElements.connectedElementPadding),
        ThemedTextFormField(
          hintText: 'Confirm Password',
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        Container(height: ThemeElements.connectedElementPadding),
        _termsAndConditionsField(themeData),
      ],
    );
  }

  Widget _termsAndConditionsField(ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularCheckBox(
          onChanged: (bool value) {
            setState(() {
              _termsAndConditions = value;
            });
          },
          value: _termsAndConditions,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text('I agree to the '),
        Text(
          'Terms and Conditions',
          style: TextStyle(color: themeData.accentColor, fontWeight: FontWeight.bold, letterSpacing: .5),
        ),
        Container(
          width: 12.0,
        ),
      ],
    );
  }

  Widget _continueButtons(ThemeData themeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ThemedPrimaryButton(themeData, text: 'Create New Account', onPressed: () {
          widget.onRegister();
        }),
        Container(height: ThemeElements.connectedElementPadding),
        ThemedSecondaryButton.big(
          themeData,
          text: 'Skip',
          onPressed: () {
            widget.onSkip();
          },
        ),
      ],
    );
  }
}

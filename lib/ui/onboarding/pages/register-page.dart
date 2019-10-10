import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-flat-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-raised-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedScaffold(
      appBar: ThemedAppBar(
        themeData,
        titleText: 'Create New Account',
      ),
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
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
            Text(
              'Only one more step!',
              style: themeData.textTheme.display1,
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 10),
            _inputFields(themeData),
            Spacer(flex: 10),
            _continueButtons(themeData),
          ],
        ),
      ),
    );
  }

  Widget _inputFields(ThemeData themeData) {
    return Column(
      children: <Widget>[
        ThemedTextFormField(
          hintText: 'Email',
        ),
        Container(height: ThemeElements.connectedElementPadding),
        ThemedTextFormField(
          hintText: 'Password',
        ),
        Container(height: ThemeElements.connectedElementPadding),
        ThemedTextFormField(
          hintText: 'Confirm Password',
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
        ThemedRaisedButton(themeData, text: 'Create New Account', onPressed: () {}),
        Container(height: ThemeElements.connectedElementPadding),
        ThemedFlatButton.big(
          themeData,
          text: 'Skip',
          onPressed: () {},
        ),
      ],
    );
  }
}

import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-flat-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-raised-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
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
  final _formKey = GlobalKey<FormState>();

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
              'You Are Only One Step Away!',
              style: themeData.textTheme.display2,
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 10),
            _inputFields(themeData),
            Spacer(flex: 15),
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
      ],
    );
  }

  Widget _continueButtons(ThemeData themeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ThemedRaisedButton(themeData, text: 'Create New Account', onPressed: () {}),
        Container(height: ThemeElements.connectedElementPadding),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ThemedFlatButton(themeData, text: 'What is the difference?', onPressed: () {}),
          ],
        ),
        Container(height: ThemeElements.connectedElementPadding),
        ThemedRaisedButton(
          themeData,
          text: 'Skip',
          onPressed: () {},
          primaryColor: false,
        ),
      ],
    );
  }
}

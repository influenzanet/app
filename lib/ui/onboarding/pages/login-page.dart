import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:flutter/material.dart';

class LoginPage extends ScaffoldPage {
  final void Function() onLogin;

  LoginPage({this.onLogin}) : super(titleText: 'Login', scrollable: true, drawer: false);

  @override
  Widget buildBody(BuildContext context, ThemeData themeData) {
    return LoginForm(onLogin);
  }
}

class LoginForm extends StatefulWidget {
  final void Function() onLogin;

  LoginForm(this.onLogin);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  static final _formKey = GlobalKey<FormState>();

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
            Spacer(flex: 18),
            _loginButton(themeData),
          ],
        ),
      ),
    );
  }

  Widget _encouragement(ThemeData themeData) {
    return Text(
      'Welcome back!',
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
        ThemedSecondaryButton(themeData, text: 'Forgot Password?', onPressed: () {}),
      ],
    );
  }

  Widget _loginButton(ThemeData themeData) {
    return ThemedPrimaryButton(themeData, text: 'Login', onPressed: () {
      widget.onLogin();
    });
  }
}

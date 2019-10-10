import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-flat-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-raised-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedScaffold(
      appBar: ThemedAppBar(
        themeData,
        titleText: 'Login',
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
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
              'Welcome Back!',
              style: themeData.textTheme.display2,
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 10),
            _inputFields(themeData),
            Spacer(flex: 18),
            ThemedRaisedButton(themeData, text: 'Login', onPressed: () {}),
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
        Container(height: ThemeElements.elementPadding),
        ThemedTextFormField(
          hintText: 'Password',
        ),
        Container(height: ThemeElements.connectedElementPadding),
        ThemedFlatButton(themeData, text: 'Forgot Password?', onPressed: () {}),
      ],
    );
  }
}

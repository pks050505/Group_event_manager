import 'package:flutter/material.dart';
import 'package:contribution_app/providers/providers.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends ConsumerWidget {
  static const route = '/login';
  void updateEmail(BuildContext context, String email) {
    context.read(emailProvider).state = email;
  }

  void updatePassword(BuildContext context, String password) {
    context.read(passwordProvider).state = password;
  }

  @override
  Widget build(context, watch) {
    final email = watch(emailProvider).state;
    final password = watch(passwordProvider).state;
    final _auth = watch(authClassProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome to Group Expence Manager',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (val) => updateEmail(context, val),
                  decoration:
                      InputDecoration(hintText: email ?? 'abc@email.com'),
                ),
                TextField(
                  onChanged: (val) => updatePassword(context, val),
                  decoration: InputDecoration(hintText: password ?? 'password'),
                ),
                OutlineButton.icon(
                  icon: Icon(Icons.supervised_user_circle),
                  label: Text('Login'),
                  onPressed: () => _auth.login(email, password),
                ),
                SignInButton(
                  Buttons.Google,
                  text: 'Login with google',
                  onPressed: () async {
                    await _auth.googleSignIn();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

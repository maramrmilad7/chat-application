import 'package:flutter/material.dart';
import 'package:simplechatapp/services/Authentication/auth_service.dart';
import 'package:simplechatapp/widgets/custom_button.dart';
import 'package:simplechatapp/widgets/custom_snackbar.dart';
import 'package:simplechatapp/widgets/custom_text_feild.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
    final void Function()? onTap;

//login method
  void login(BuildContext context) async {
    //get auth service
    final AuthServices auth = AuthServices();
    //call the signInWithEmailAndPassword method
    try {
      await auth.signInWithEmailAndPassword(
          _emailController.text, _pwController.text);
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              color: Theme.of(context).colorScheme.primary,
              size: 60,
            ),
            const SizedBox(height: 20),
            Text('Welcome back, You have been missed!',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                )),
            const SizedBox(height: 20),
            CustomTextFeild(
              controller: _emailController,
              obscureText: false,
              hintText: 'Email',
            ),
            const SizedBox(height: 18),
            CustomTextFeild(
              controller: _pwController,
              obscureText: true,
              hintText: 'Password',
            ),
            const SizedBox(height: 25),
            CustomButton(
              onTap: () {
                login(context);
              },
              text: 'Login',
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member ?',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                 GestureDetector(
                  onTap:onTap,
                   child: Text(
                      'Register now',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                 ),
                
              ],
            )
          ],
        )));
  }
}

/*import 'package:flutter/material.dart';
import 'package:simplechatapp/services/auth_service.dart';
import 'package:simplechatapp/widgets/custom_button.dart';
import 'package:simplechatapp/widgets/custom_snackbar.dart';
import 'package:simplechatapp/widgets/custom_text_feild.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, this.onTap});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _confirmController = TextEditingController();

  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  void register(BuildContext context) async {
    final AuthServices auth = AuthServices();
    if (_pwController.text == _confirmController.text) {
      try {
        await auth.createUserWithEmailAndPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        print(e.toString());
      }
    } else {
      showSnackBar(context, 'Password does not match');
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
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
              Text("Let's create an account for you!",
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
              const SizedBox(height: 18),
              CustomTextFeild(
                controller: _confirmController,
                obscureText: true,
                hintText: 'Confirm Password',
              ),
              const SizedBox(height: 25),
              CustomButton(
                text: 'Register',
                onTap: () {
                  register(context);
                },
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Login ',
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
  
}
*/
import 'package:flutter/material.dart';
import 'package:simplechatapp/services/Authentication/auth_service.dart';
import 'package:simplechatapp/widgets/custom_button.dart';
import 'package:simplechatapp/widgets/custom_snackbar.dart';
import 'package:simplechatapp/widgets/custom_text_feild.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  void register(BuildContext context) async {
    final AuthServices auth = AuthServices();
    if (_pwController.text == _confirmController.text) {
      try {
        await auth.createUserWithEmailAndPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        print(e.toString());
      }
    } else {
      showSnackBar(context, 'Password does not match');
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
            Text(
              "Let's create an account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
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
            const SizedBox(height: 18),
            CustomTextFeild(
              controller: _confirmController,
              obscureText: true,
              hintText: 'Confirm Password',
            ),
            const SizedBox(height: 25),
            CustomButton(
              text: 'Register',
              onTap: () {
                register(context);
              },
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

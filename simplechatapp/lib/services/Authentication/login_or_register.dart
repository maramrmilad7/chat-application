import 'package:flutter/material.dart';
import 'package:simplechatapp/pages/login_page.dart';
import 'package:simplechatapp/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show login page
  bool showLoginPage = true;
  //toggle between login and register page
  void toggleView() {
    setState(() => showLoginPage = !showLoginPage);
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap:toggleView ,);
    } else {
      return RegisterPage(onTap: toggleView,);
    }
  }
}

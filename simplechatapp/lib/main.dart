import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplechatapp/firebase_options.dart';
import 'package:simplechatapp/pages/login_page.dart';
import 'package:simplechatapp/pages/register_page.dart';
import 'package:simplechatapp/services/Authentication/auth_gate.dart';
import 'package:simplechatapp/themes/light_theme.dart';
import 'package:simplechatapp/themes/theme_provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child:const ChatAPP(),
    ),
  );
}

class ChatAPP extends StatelessWidget {
  const ChatAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}

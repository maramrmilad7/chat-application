import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplechatapp/themes/theme_provider.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});
  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    bool isdarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isCurrentUser
            ? isdarkMode
                ? Colors.grey.shade900
                : Colors.grey.shade200
            : isdarkMode
                ? Colors.grey.shade900
                : Colors.grey.shade200,
      ),
      child: Text(
        message,
        style: TextStyle(color: isCurrentUser? Colors.white:
         isdarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}

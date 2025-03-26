import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simplechatapp/services/Authentication/auth_service.dart';
import 'package:simplechatapp/services/chat/chat.dart';
import 'package:simplechatapp/widgets/chatt_bubble.dart';
import 'package:simplechatapp/widgets/custom_text_feild.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});
  final String receiverEmail;
  final String receiverID;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();

  final ChatServices chatServices = ChatServices();

  final AuthServices authServices = AuthServices();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 500), () => ScrollDown());
      }
    });
    Future.delayed(Duration(milliseconds: 500), () => ScrollDown());
  }

  @override
  void dispose() {
    focusNode.dispose();
    messageController.dispose();
    super.dispose();
  }

  final ScrollController scrollController = ScrollController();
  void ScrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  //send message
  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      chatServices.sendMessage(widget.receiverID, messageController.text);
      messageController.clear();
    }
    ScrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          widget.receiverEmail,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: buildMessageList(),
          ),
          buildUserInput(),
        ],
      ),
    );
  }

  Widget buildMessageList() {
    String senderID = authServices.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: chatServices.getMessages(senderID, widget.receiverID),
        builder: (context, snapshot) {
          //errors
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          //data
          return ListView(
            controller: scrollController,
            children: snapshot.data!.docs.map((doc) {
              return buildMessageItem(doc);
            }).toList(),
          );
        });
  }

  Widget buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderId'] == authServices.getCurrentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(message: data['message'], isCurrentUser: isCurrentUser)
        ],
      ),
    );
  }

  Widget buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 58),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFeild(
              focusNode: focusNode,
              controller: messageController,
              obscureText: false,
              hintText: 'Type a message',
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              icon: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              onPressed: sendMessage,
            ),
          )
        ],
      ),
    );
  }
}

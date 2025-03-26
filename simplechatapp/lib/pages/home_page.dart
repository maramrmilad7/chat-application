import 'package:flutter/material.dart';
import 'package:simplechatapp/pages/Chat_Page.dart';
import 'package:simplechatapp/services/Authentication/auth_service.dart';
import 'package:simplechatapp/services/chat/chat.dart';
import 'package:simplechatapp/themes/light_theme.dart';
import 'package:simplechatapp/widgets/custom_drawer.dart';
import 'package:simplechatapp/widgets/custom_user_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  //create instance from AuthServices and ChatServices
  final AuthServices _auth = AuthServices();
  final ChatServices _chat = ChatServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.grey),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      drawer: CustomDrawer(),
      body: _BuildUserList(),
    );
  }

  Widget _BuildUserList() {
    return StreamBuilder(
        stream: _chat.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
              children: snapshot.data!
                  .map<Widget>(
                      (userData) => _BuildUserListItem(userData, context))
                  .toList());
        });
  }

  Widget _BuildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != _auth.getCurrentUser()!.email) {
      return UserTile(
          text: userData['email'],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatPage(
                      receiverID: userData['uid'],
                          receiverEmail: userData['email'],
                        )));
          });
    } else {
      return Container();
    }
  }
}

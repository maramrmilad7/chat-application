import 'package:flutter/material.dart';
import 'package:simplechatapp/pages/settings.dart';
import 'package:simplechatapp/services/Authentication/auth_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              DrawerHeader(
                child: Center(
                    child: Icon(
                  Icons.message,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                )),
              ),
              //home list tile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: Text('H O M E'),
                  leading: Icon(Icons.home),
                ),
              ),
              //setting list tile
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                  title: Text('S E T T I N G S'),
                  leading: Icon(Icons.settings),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 450),
                child: ListTile(
                  onTap:Logout ,
                  title: Text('L O G O U T'),
                  leading: Icon(Icons.logout),
                ),
              )
              //log out list tile
            ],
          ),
        ],
      ),
    );
    
  }
  void Logout() async {
    final AuthServices _auth = AuthServices();
    await _auth.signOut();
  }
}

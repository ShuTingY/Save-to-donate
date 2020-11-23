import 'package:flutter/material.dart';
import 'package:save_to_donate/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Save 2 Donate'),
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
               icon: Icon(Icons.person),
               label: Text('Logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
          )
        ],
      ),
    );
  }
}

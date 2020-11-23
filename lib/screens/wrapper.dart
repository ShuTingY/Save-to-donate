import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_to_donate/screens/authentication/authentication.dart';
import 'package:save_to_donate/models/appUser.dart';
import 'package:save_to_donate/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AppUser>(context);
    print(user);
    // return either home or Auth widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}

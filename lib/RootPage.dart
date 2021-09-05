import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/LoginPage.dart';
import 'package:instagram_clone/TabPage.dart';

import 'LoginPage.dart';
import 'TabPage.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return TabPage();
    // return LoginPage();

    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      print('snapshot $snapshot');
      if (snapshot.hasData) {
        return TabPage(snapshot.data);
      }
      return LoginPage();
    });
  }
}

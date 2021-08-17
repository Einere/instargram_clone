import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    GoogleAuthCredential googleAuthCredential = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    UserCredential userCredential = await _firebaseAuth.signInWithCredential(googleAuthCredential);
    User user = userCredential.user;

    return user;
  }

  @override
  Widget build(BuildContext context) {
    // return _build();
    return FutureBuilder(future: Firebase.initializeApp(), builder: (context, snapshot) {
      return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Instagram Clone',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.all(48)),
                SignInButton(Buttons.Google, onPressed: () {

                  _handleSignIn().then((user) {
                    print(user);
                  });
                })
              ],
            ),
          ));
    });
  }
}

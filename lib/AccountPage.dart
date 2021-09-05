import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  final User user;

  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String profilePicUrl;
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: renderBody(),
    );
  }


  @override
  void initState() {
    super.initState();
    this.profilePicUrl = widget.user.photoURL;
    this.name = widget.user.displayName;
  }

  Widget renderAppBar() {
    return AppBar(
      actions: [
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: signOut)
      ],
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    googleSignIn.signOut();
  }

  Widget renderBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profilePicUrl),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                              width: 28,
                              height: 28,
                              child: FloatingActionButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add ))),
                          SizedBox(
                              width: 25,
                              height: 25,
                              child: FloatingActionButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.add)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
          AlignedCenterText('0\n게시물'),
          AlignedCenterText('1\n팔로워'),
          AlignedCenterText('1\n팔로잉')
        ],
      ),
    );
  }

  Widget AlignedCenterText(text) {
    return Text(text,
        textAlign: TextAlign.center, style: TextStyle(fontSize: 16));
  }
}

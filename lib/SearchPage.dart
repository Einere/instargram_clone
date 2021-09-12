import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/DetailPage.dart';

import 'CreatePage.dart';

class SearchPage extends StatefulWidget {
  final User user;

  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: goToCreatePage(context),
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Function goToCreatePage(context) {
    return () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
    };
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('post').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List items = snapshot.data.docs ?? [];

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemBuilder: (context, index) {
            return _itemBuilder(context, index, items[index]);
          },
          itemCount: items.length,
        );
      },
    );
  }

  Widget _itemBuilder(BuildContext context, int index,
      QueryDocumentSnapshot item) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) {
              return DetailPage(item);
          }));
        },
        child: Image.network(item.get('photoUri')));
  }
}

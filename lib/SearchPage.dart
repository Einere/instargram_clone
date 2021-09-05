import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreatePage()));
    };
  }

  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,

        ),
        itemBuilder: _itemBuilder,
        itemCount: 5,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Image.network(
      'https://images.mypetlife.co.kr/content/uploads/2018/07/09160052/puppy-1189067_1280.jpg',
      fit: BoxFit.cover
    );
  }
}

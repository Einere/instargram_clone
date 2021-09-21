import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final QueryDocumentSnapshot snapshot;

  DetailPage(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.get('authorPhotoUrl')),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.get('authorEmail'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(snapshot.get('authorName')),
                      ]),
                ),
              ],
            ),
          ),
          AspectRatio(
              aspectRatio: 1 / 1,
              child:
                  Hero(tag: snapshot.get('photoUri'),
                  child: Image.network(snapshot.get('photoUri'), fit: BoxFit.cover))),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(snapshot.get('content')),
          )
        ],
      ),
    ));
  }
}

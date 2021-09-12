import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final User user;

  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  XFile pickedFile;
  File loadedImage;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _renderBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.blue,
        onPressed: loadImage,
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[IconButton(icon: Icon(Icons.send), onPressed: post)],
    );
  }

  void post() {
    Reference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('post')
        .child('${DateTime.now().millisecondsSinceEpoch}.png');
    UploadTask task = firebaseStorageRef.putFile(
        loadedImage, SettableMetadata(contentType: 'image/png'));
    task.whenComplete(() => null).then((value) {
      Future<String> downloadUrlFuture = value.ref.getDownloadURL();
      downloadUrlFuture.then((uri) {
        DocumentReference<Map<String, dynamic>> docRef =
            FirebaseFirestore.instance.collection('post').doc();
        docRef.set({
          'id': docRef.id,
          'photoUri': uri.toString(),
          'content': textController.text,
          'authorEmail': widget.user.email,
          'authorName': widget.user.displayName,
          'authorPhotoUrl' : widget.user.photoURL,
        })
        .then((value) {
          Navigator.pop(context);
        });
      });
    });
  }

  Widget _renderBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                  // alignment: Alignment.center,
                  child: loadedImage == null
                      ? Text('no image')
                      : Image.file(loadedImage, fit: BoxFit.cover))),
          // child: Image.network('https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F27118F4259357D530B', fit: BoxFit.fitWidth))),
          TextField(
            controller: textController,
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
          )
        ],
      ),
    );
  }

  Future<void> loadImage() async {
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      loadedImage = File(pickedFile.path);
    });
  }
}

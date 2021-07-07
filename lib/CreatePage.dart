import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  PickedFile pickedFile;
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

  void post() {}

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
    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      loadedImage = File(pickedFile.path);
    });
  }
}

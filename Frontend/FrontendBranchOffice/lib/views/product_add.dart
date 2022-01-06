import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import "package:FrontendBranchOffice/assets/const.dart";

class SelectPhoto extends StatefulWidget {
  @override
  _SelectPhotoState createState() => _SelectPhotoState();
}

class _SelectPhotoState extends State<SelectPhoto> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      this.image = imageTemporary;
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            pickImage();
          },
          tooltip: 'Increment',
          child: Icon(Icons.camera_alt),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

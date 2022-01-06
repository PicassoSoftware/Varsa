import 'dart:io';
import "package:flutter/material.dart";

import "package:image_cropper/image_cropper.dart";
import 'package:image_picker/image_picker.dart';
class Utils {
  Utils._();

  /// Open image gallery and pick an image
  static Future<XFile?> pickImageFromGallery() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }



  /// Pick Image From Gallery and return a File
  static Future<File?> cropSelectedImage(String filePath) async {
    
    return await ImageCropper.cropImage(
      sourcePath: filePath,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      iosUiSettings: const IOSUiSettings(
        title: 'Crop Image',
        aspectRatioLockEnabled: true,
        minimumAspectRatio: 1.0,
        aspectRatioPickerButtonHidden: true,
      ),
    );
  }
}
class SelectImage extends StatefulWidget {
  const SelectImage({Key? key}) : super(key: key);

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null) ...[
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(image!),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: -5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
              TextButton(
                onPressed: () async {
                  // Step #1: Pick Image From Galler.
                  await Utils.pickImageFromGallery().then((pickedFile) async {
                    // Step #2: Check if we actually picked an image. Otherwise -> stop;
                    if (pickedFile == null) return;

                    // Step #3: Crop earlier selected image
                    await Utils.cropSelectedImage(pickedFile.path)
                        .then((croppedFile) {
                      // Step #4: Check if we actually cropped an image. Otherwise -> stop;
                      if (croppedFile == null) return ;

                      // Step #5: Display image on screen
                      setState(() {
                        image = croppedFile;
                      });
                    });
                  });
                },
                child: const Text('Fotoğraf Yükleyiniz...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
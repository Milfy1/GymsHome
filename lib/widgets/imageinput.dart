import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:gymhome/GymOwnerwidgets/facilities.dart';

class ImageInput extends StatefulWidget {
  @override
  Function onselectimage;
  ImageInput(this.onselectimage);
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _saveimage;

  Future getImageGallery() async {
    final image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      this._saveimage = imageTemp;
    });
  }

  Future getImageCamera() async {
    final image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      this._saveimage = imageTemp;
    });
  }

/*
  Future<void> _takedpicture() async {
    final Imagefile = await ImagePicker.platform.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
      maxHeight: null,
      imageQuality: null,
      preferredCameraDevice: CameraDevice.rear,
    ) as File;
    final imageTemp = File(Imagefile.path);
    setState(() {
      _saveimage = Imagefile;
    });
  } */
  //final appdur =
  //    await syspath.getApplicationDocumentsDirectory(); //to save Image local
  //final filename = path.basename(Imagefile.path);
  // final savedimagess = await Imagefile.copy('${appdur.path} /$filename');
  // widget.onselectimage(savedimagess);
  //}

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            FlatButton.icon(
              onPressed: getImageCamera,
              icon: Icon(
                Icons.camera_alt,
                color: Colors.blue,
              ),
              label: Text('Take picture'),
            ),
            FlatButton.icon(
              onPressed: getImageGallery,
              icon: Icon(
                Icons.camera,
                color: Colors.blue,
              ),
              label: Text('Choose from gallery'),
            )
          ],
        ),
        _saveimage != null
            ? Image.file(
                _saveimage!,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              )
            : Container(
                width: 150,
                height: 120,
              )
        //Container(
        //   height: 150,
        //    width: 350,
        //    decoration: BoxDecoration(
        //        border: Border.all(width: 1, color: Colors.grey)),
        //  ),
      ],
    );
  }
}

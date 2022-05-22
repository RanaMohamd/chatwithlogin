import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:petshelt/breedScreen/DetectBreed.dart';


class breedsScreen extends StatefulWidget {

  static const String routeName = "breedsScreen";

  @override
  State<breedsScreen> createState() => _breedsScreenState();
}

class _breedsScreenState extends State<breedsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breeds'),),
      body: bottomSheet(),
    );
  }
}

Widget bottomSheet() {
  String _image = '';
  var file;
  var imagepicker = ImagePicker();
  String result;
  void showSnackBar(String s, Duration duration) {
  }


  Future<dynamic> _uploadFile(filePath) async {
    String fileName = Path.basename(filePath.path);
    // print("file base name: $fileName");
    try {
      FormData formData = new FormData.fromMap({
        "image":
        await MultipartFile.fromFile(filePath.path, filename: fileName),
      });

      Dio dio = new Dio();
      dio.options.contentType = 'multipart/form-data';
      Response response =
      await dio.post('https://pet-breed.herokuapp.com/predict',
          data: formData,
          );
      print(
          "File Uploaded response: $response"); // where are remaining of data ?
      // _showSnackbarMsg(response.data['message']);
      // print(response.data);
      return response.data;
      result=response.data;
    } catch (e) {
      print("exception : $e");
      return null;
    }
  }


  getImagefromcamera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image != null) {
      file = File(image.path);
      _image = image.path;
      _uploadFile(file);
    } else {
      showSnackBar("No File selected", Duration(milliseconds: 400));
    }
  }

  getImagefromgallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      _image = image.path;
      Map<String, dynamic> result = await _uploadFile(file);
      if (result != null) {
        print(result["breed"]);
      }

    } else {
      showSnackBar("No File selected", Duration(milliseconds: 400));
    }
  }


  return Container(
    height: 100,
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
    child: Row(
      children: [
        Expanded(
          child: TextButton.icon(onPressed: () {
            getImagefromcamera();
          },
              icon: const Icon(Icons.camera_alt,
                color: Colors.black54,
                size: 35,),
              label: const Text('Camera',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: "inter",
                    color: Colors.black54
                ),)),
        ),
        Expanded(
          child: TextButton.icon(onPressed: () {
            getImagefromgallery();
          },
              icon: const Icon(Icons.image,
                color: Colors.black54,
                size: 35,),
              label: const Text('Gallery',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: "inter",
                    color: Colors.black54
                ),)),
        )
      ],
    ),
  );
}

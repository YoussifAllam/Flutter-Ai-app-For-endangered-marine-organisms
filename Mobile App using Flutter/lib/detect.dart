import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'model.dart';

class detect extends StatelessWidget {
  File? image;
  double? imageWidth;
  double? imageHieght;
  double? boxX;
  double? boxY;
  double? boxHeight;
  double? boxWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(child: Text('Detect organism')),
      ),
      body: SafeArea(
        child: Center(
            child: image == null
                ? const Text("Please Select Photo")
                : imagee(image!.path, imageWidth!, imageHieght!, boxX!, boxY!,
                    boxHeight!, boxWidth!)),
      ),
      floatingActionButton: FloatingActionButton(onPressed: pickImage),
    );
  }

  Future pickImage() async {
    var dio = Dio();
    final options = BaseOptions(
      baseUrl: 'https://api.pub.dev',
      connectTimeout: const Duration(seconds:15),
      receiveTimeout:const  Duration(seconds :15),
    );
    var saveimg = await ImagePicker().getImage(source: ImageSource.gallery);
    if (saveimg == null) return null;

    image = File(saveimg.path);

    if (image != null) {

      File file = File(image!.path);

      String apiKey = "e3yYMHtMTpOKUi30Vt2R";

      List<int> imageBytes = await file.readAsBytes();
      String imageBase64 = base64Encode(imageBytes);

      String url = "https://detect.roboflow.com/haha-fmrru/1";
      Map<String, dynamic> queryParams = {
        "api_key": apiKey,
      };
      Map<String, String> headers = {
        "Content-Type": "application/x-www-form-urlencoded",
      };
      String requestBody = "data:${Uri.encodeComponent(imageBase64)}";

      try {
        var response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: requestBody,
        );
        print(response.body);
        final detection = Detection.fromJson(jsonDecode(response.body));
        imageWidth=detection.image.width ;
        imageHieght=detection.image.height ;
        boxWidth=detection.predictions[0].width ;
        boxHeight=detection.predictions[0].height ;
        boxX=detection.predictions[0].x;
        boxY=detection.predictions[0].y;
      } catch (e) {
        print(e);
      }


















      // try {
      //   FormData formData = FormData.fromMap(
      //       {'api_key': 'e3yYMHtMTpOKUi30Vt2R', 'image': imgB64});
      //
      //   Response response = await dio
      //       .post("https://detect.roboflow.com/haha-fmrru/1", data: formData,options: Options (
      //     validateStatus: (_) => true,
      //     contentType: Headers.jsonContentType,
      //     responseType:ResponseType.json,
      //     headers: {
      //
      //       HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
      //       // 'Authorization': 'Bearer ',
      //     }
      //   ));
      //
      //   print(response.data);
      //   final detection = Detection.fromJson(jsonDecode(response.data));
      //   imageWidth=detection.image.width ;
      //   imageHieght=detection.image.height ;
      //   boxWidth=detection.predictions[0].width ;
      //   boxHeight=detection.predictions[0].height ;
      //   boxX=detection.predictions[0].x;
      //   boxY=detection.predictions[0].y;
      //   // print(object)
      // } catch (e) {
      //   print(e);
      // }
    // } else {
    //   print('No image selected');
    // }
  }
}

Widget imagee(String imagePath, double imageWidth, double imageHieght,
    double boxX, double boxY, double boxHeight, double boxWidth) {
  return Container(
    child: FittedBox(
      fit: BoxFit.contain,
      child: Stack(
        children: [
          Image.asset(
            "imagePath",
            width: imageWidth,
            height: imageHieght,
          ),
          Positioned(
            left: boxX,
            top: boxY,
            child: Container(
                height: boxHeight,
                width: boxWidth,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 30, color: Colors.amber))),
          )
        ],
      ),
    ),
  );
}}

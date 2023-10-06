import 'package:flutter/material.dart' show Alignment, BorderRadius, BoxDecoration, Color, Colors, Container, Curves, FontWeight, Image, LinearGradient, Offset, Positioned, Text, TextStyle, Widget;
import 'package:flutter_tilt/flutter_tilt.dart';

final Map<String,String> category={
  "coral":"assets/coral.jpg",
  "dolphin":"assets/dolphin.jpg",
  "fishs":"assets/fishs.jpg",
  "shark":"assets/shark.jpg",
  "turtle":"assets/turtle.jpg",
  "whale":"assets/whale.jpg",

};

final List<String> categoryValues = [
  "assets/coral.jpg",
  "assets/dolphin.jpg",
  "assets/fishs.jpg",
  "assets/shark.jpg",
  "assets/turtle.jpg",
  "assets/whale.jpg"
];
class myColors{
  static const Color appbarColor = Color(0xff062358);
  static const Color drawerBackgroundColor  =Color(0xFF0FADEC);
  static const Color drawerIconColor  =Colors.white;



}



Widget tilt (){
  return
    Tilt(
      borderRadius: BorderRadius.circular(30),
      tiltConfig: const TiltConfig(
        angle: 30,
        leaveDuration: Duration(seconds: 1),
        leaveCurve: Curves.bounceOut,
      ),
      childLayout: const ChildLayout(
        outer: [
          Positioned(
            child: TiltParallax(
              size: Offset(40, 40),
              child: Text(
                'Flutter Tilt ✨',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      child: Container(
        width: 350,
        height: 200,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF80d0c7), Color(0xFF13547a)],
          ),
        ),
      ),
    )

  ;
}







String data ='''
{
	"isExist":"yes",
	"component":"",
	"isSvgBackground":"yes",	
	"isBold":"yes",
    "color":"0xFFFFFFFF",
	"font":30,
	"componentPlaceInX":10,	
	"componentPlaceInY":10,	
	"componentHeight":20,
	"componentWidth":20	
},

{
	"isExist":"yes",
	"component":"John Doe",
	"isSvgBackground":"no",	
	"isBold":"yes",
	"color":"0xFFFFFFFF",
	"font":30,
	"componentPlaceInX":15.250,	
	"componentPlaceInY":32.727,	
	"componentHeight":36.370,
	"componentWidth":373.831	
},
{
	"isExist":"yes",
	"component":"Web Developer",
	"isSvgBackground":"no",	
	"isBold":"yes",
	"color":"0xFFFFFFFF",
	"font":26,
	"componentPlaceInX":16.922,	
	"componentPlaceInY":90.776,	
	"componentHeight":31.014,
	"componentWidth":380.381	
},

{
	"isExist":"yes",
	"component":"johndoe@email.com",
	"isSvgBackground":"no",	
	"isBold":"yes",
	"color":"0xFFFFFFFF",
	"font":17,
	"componentPlaceInX":211.113,	
	"componentPlaceInY":141.867,	
	"componentHeight":21.757,
	"componentWidth":125.769	
},
{
	"isExist":"yes",
	"component":"(123) 456-7890",
	"isSvgBackground":"no",	
	"isBold":"yes",
	"color":"0xFFFFFFFF",
	"font":17,
	"componentPlaceInX":16.922,	
	"componentPlaceInY":141.867	,
	"componentHeight":21.757,
	"componentWidth":173.223
},
''';









// ShaderMask(
// shaderCallback: (rect) {
// return LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// colors: [
// Colors.white.withOpacity(0.1),
// Colors.transparent
// ],
// ).createShader(
// Rect.fromLTRB(0, 0, rect.width, rect.height));
// },
// blendMode: BlendMode.srcATop,
// child:
// ),
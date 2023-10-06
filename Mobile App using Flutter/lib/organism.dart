import 'package:astrotech/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class animall extends StatelessWidget {
   animall({super.key});
   Dio dio= Dio(BaseOptions(
   baseUrl: 'http://10.40.101.7:1337',
   receiveDataWhenStatusError: true,

   ));


Future<Temperat> temperat()async{
  var response = await dio.get(
    '/api/oranisms?populate=*',
  );
  return  Temperat(data: response.data['data'], meta: response.data['meta']);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade300),

      body: SafeArea(

        child: ListView(children: [


        ]),
      ),
    );
  }
}

import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:astrotech/drawer.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'Constants.dart';
import 'model.dart';
import 'organism.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 1;
  bool getOrganism = false;
  bool getCategory = false;
  Temperatures? temperatures;
  var animal;

  int get tabIndex => _tabIndex;

  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

 void getCategoryData() async {
    try {
        Dio? dio;

        BaseOptions options = BaseOptions(
          baseUrl: 'http://10.40.101.7:1337',
          receiveDataWhenStatusError: true,

        );
        dio = Dio(options);
       var response = await dio.get(
        '/api/categories?populate=*',
       );
       temperatures=Temperatures(data: response.data['data'], meta: response.data['meta']);
      print(temperatures!.data[0].attributes.photos.data[0].attributes.url);
      //Items items =Items(name: '', description: description, photo1: photo1, photo2: photo2, category: category);

      getCategory = true;
    } catch (e) {
      print(e);
      getCategory = false;
    }
  }


@override
  void initState() {
  pageController = PageController(initialPage: _tabIndex);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade300),
      drawer: const DrawerRight(userData: ''),
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Icon(Icons.chat, color: Colors.blue.shade900),
          Icon(Icons.home, color: Colors.blue.shade900),
          Icon(Icons.signpost_rounded, color: Colors.blue.shade900),
        ],
        inactiveIcons: const [
          FittedBox(child: Text("chat")),
          FittedBox(child: Text("Home")),
          FittedBox(child: Text("posts")),
        ],
        color: Colors.white.withOpacity(0.8),
        height: 60,
        circleWidth: 45,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          debugPrint(tabIndex.toString());
          pageController.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.blue.shade900,
        elevation: 10,
      ),
      body: SafeArea(
        top: true,
        maintainBottomViewPadding: true,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.blue.shade50,
                Colors.blueAccent.shade400,
              ])),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (v) {
              tabIndex = v;
            },
            children: [
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.red),
              ListView(
                padding: const EdgeInsets.all(10),

                // width: double.infinity,
                children: [
                  tilt(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 250.0,
                    child: DefaultTextStyle(
                      style: TextStyle(
                          fontSize: 30.0,
                          // fontFamily: 'Agne',
                          color: Colors.blue.shade900),
                      child: AnimatedTextKit(
                        totalRepeatCount: 10,
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          TypewriterAnimatedText('Read',
                              speed: const Duration(milliseconds: 500)),
                          TypewriterAnimatedText('Browse',
                              speed: const Duration(milliseconds: 500)),
                          TypewriterAnimatedText('Discover',
                              speed: const Duration(milliseconds: 500)),
                          TypewriterAnimatedText('Endangered species',
                              speed: const Duration(milliseconds: 500)),
                        ],
                      ),
                    ),
                  ),
                  CarouselImages(
                    scaleFactor: 0.8,
                    listImages: categoryValues,
                    height: height * 0.3,
                    borderRadius: 30.0,
                    cachedNetworkImage: true,
                    verticalAlignment: Alignment.topCenter,
                    onTap: (index) {
                      getCategoryData();

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => animall()));
                    },
                  ),
                ],
              ),
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

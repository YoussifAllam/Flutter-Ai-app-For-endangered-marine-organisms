import 'dart:io';
import 'package:astrotech/Constants.dart';
import 'package:astrotech/detect.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerRight extends StatefulWidget {
  final userData;

  const DrawerRight({Key? key, required this.userData}) : super(key: key);

  @override
  State<DrawerRight> createState() => _DrawerRightState();
}

class _DrawerRightState extends State<DrawerRight> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(30), bottomEnd: Radius.circular(30))),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.blue.shade200,
              Colors.blueAccent.shade400,
            ])),
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(5, 60, 5, 60),
          children: [
            if (widget.userData.length == 0)
              Icon(
                  size: MediaQuery.of(context).size.height * 0.25,
                  Icons.account_circle,
                  color: myColors.drawerIconColor)
            else if (widget.userData['imagePath'] == '')
              Icon(
                  size: MediaQuery.of(context).size.height * 0.25,
                  Icons.account_circle,
                  color: myColors.drawerIconColor)
            else
              ClipOval(
                child: Image.file(
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.height * 0.25,
                    File(widget.userData['imagePath'])),
              ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                    widget.userData.length == 0
                        ? "User"
                        : widget.userData['name'],
                    style: const TextStyle(
                        fontSize: 24,
                        color: myColors.drawerIconColor,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ListTile(
                  title: const Text(
                    "Search by scan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: myColors.drawerIconColor),
                  ),
                  leading: const Icon(Icons.camera_alt_sharp,
                      color: myColors.drawerIconColor),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: myColors.drawerIconColor,
                  ),
                  onTap: ()async {
                    if (widget.userData.length == 0) {

                        if (!await launchUrl(
                            mode: LaunchMode.inAppWebView,
                            Uri.parse("https://detect.roboflow.com/?model=fishes-o0t0y&version=6&api_key=uJn4BTnFdPhrTPU0K3tU"))) {
                          throw 'Could not launch ${Uri.parse("https://detect.roboflow.com/?model=fishes-o0t0y&version=6&api_key=uJn4BTnFdPhrTPU0K3tU")}';
                        }

                    } else {}
                  },
                ),
                ListTile(
                  title: const Text(
                    "Settings",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: myColors.drawerIconColor),
                  ),
                  leading: const Icon(Icons.settings,
                      color: myColors.drawerIconColor),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: myColors.drawerIconColor,
                  ),
                  onTap: () {
                    if (widget.userData.length == 0) {
                    } else {}
                  },
                ),
                ListTile(
                  title: const Text(
                    "About Us",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: myColors.drawerIconColor),
                  ),
                  leading:
                      const Icon(Icons.group, color: myColors.drawerIconColor),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: myColors.drawerIconColor,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "About The App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: myColors.drawerIconColor),
                  ),
                  leading: const Icon(Icons.phone_iphone_rounded,
                      color: myColors.drawerIconColor),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: myColors.drawerIconColor,
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

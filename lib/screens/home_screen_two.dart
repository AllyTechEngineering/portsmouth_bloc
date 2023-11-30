import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portsmouth_bloc/screens/phone_landscape_screen.dart';
import 'package:portsmouth_bloc/screens/phone_portrait_screen.dart';
// import 'package:portsmouth_bloc/screens/selection_screen.dart';
import 'package:portsmouth_bloc/screens/small_phone_landscape_screen.dart';
import 'package:portsmouth_bloc/screens/small_phone_portrait_screen.dart';
import 'package:portsmouth_bloc/screens/small_tablet_landscape_screen.dart';
import 'package:portsmouth_bloc/screens/small_tablet_portrait_screen.dart';
import 'package:portsmouth_bloc/screens/tablet_landscape_screen.dart';
import 'package:portsmouth_bloc/screens/tablet_portrait_screen.dart';
import 'dart:io';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  var orientation, size, height, width;
  double fontSizeValue = 0.0;
  double appBarTitleFontSize = 0.0;
  final classImage = [];
  final classNames = <String>[
    'Centerboard Class',
    'Keelboat Class',
    'Multihull Class',
    'Offshore Class',
  ];
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    debugPrint('Orientation: $orientation');
    size = MediaQuery.of(context).size;
    debugPrint('Size: $size');
    height = size.height;
    debugPrint('Height: $height');
    width = size.width;
    debugPrint('Width: $width');
    return Scaffold(
      appBar: AppBar(
        title: Text('Round Button'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: classNames.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 150),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      backgroundColor: Colors.lightBlueAccent),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/y-flyer.png',
                        height: height * 0.08,
                        width: height * 0.08,
                        fit: BoxFit.fill,
                      ),
                      Text(classNames[index]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

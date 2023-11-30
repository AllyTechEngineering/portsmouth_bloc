import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LayoutBuilderScreen extends StatefulWidget {
  const LayoutBuilderScreen({super.key});

  @override
  State<LayoutBuilderScreen> createState() => _LayoutBuilderScreenState();
}

class _LayoutBuilderScreenState extends State<LayoutBuilderScreen> {
  // static double desktop = 900;
  // static double tablet = 600;
  // static double handset = 300;
  var orientation, size, height, width;
  bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  bool get isDesktopDevice =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
  bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
  bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      debugPrint('Orientation: Landscape');
    }
    if (orientation == Orientation.portrait) {
      debugPrint('Orientation: Portrait');
    }

    size = MediaQuery.of(context).size;
    debugPrint('Size: $size');
    height = size.height;
    debugPrint('Height: $height');
    width = size.width;
    debugPrint('Width: $width');
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Builder Example'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return _buildWideContainers();
        } else {
          return _buildNormalContainer();
        }
      }),
    );
  }

  Widget _buildNormalContainer() {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.red,
      ),
    );
  }

  Widget _buildWideContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
          ),
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:portsmouth_bloc/screens/phone_landscape_screen.dart';
// import 'package:portsmouth_bloc/screens/phone_portrait_screen.dart';
// // import 'package:portsmouth_bloc/screens/selection_screen.dart';
// import 'package:portsmouth_bloc/screens/small_phone_landscape_screen.dart';
// import 'package:portsmouth_bloc/screens/small_phone_portrait_screen.dart';
// import 'package:portsmouth_bloc/screens/small_tablet_landscape_screen.dart';
// import 'package:portsmouth_bloc/screens/small_tablet_portrait_screen.dart';
// import 'package:portsmouth_bloc/screens/tablet_landscape_screen.dart';
// import 'package:portsmouth_bloc/screens/tablet_portrait_screen.dart';
// import 'dart:io';
//
// // import '../utilities/constants.dart';
// import '../utilities/portsmouth_categories.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   var categoriesClass = CategoriesClass();
//   var orientation, size, height, width;
//   double fontSizeValue = 0.0;
//   double appBarTitleFontSize = 0.0;
//
//   @override
//   Widget build(BuildContext context) {
//     orientation = MediaQuery.of(context).orientation;
//     debugPrint('Orientation: $orientation');
//     size = MediaQuery.of(context).size;
//     debugPrint('Size: $size');
//     height = size.height;
//     debugPrint('Height: $height');
//     width = size.width;
//     debugPrint('Width: $width');
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.description_outlined,
//             // color: Colors.white,
//           ),
//           // iconSize: 40.0,
//           onPressed: () => context.go('/definition_screen'),
//         ),
//         centerTitle: true,
//         // backgroundColor: Colors.blueAccent,
//         title: Text(
//           'Portsmouth Racing Data',
//           style: TextStyle(
//             fontSize: appBarTitleFontSize = selectAppBarTextSize(),
//             color: Colors.white,
//           ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.settings,
//               // color: Colors.white,
//             ),
//             onPressed: () => context.go('/settings_screen'),
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             opacity: 0.5,
//             image: AssetImage('assets/images/ocean_background.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: <Widget>[
//                 screenSelectionChoice(),
//                 // SelectionScreen(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   } //Widget
//
//   Widget screenSelectionChoice() {
//     if (Platform.isAndroid) {
//       // debugPrint('Running on Android');
//     } else if (Platform.isIOS) {
//       // debugPrint('Running on iOS');
//       if ((orientation == Orientation.portrait) && (width >= 744 && width <= 833)) {
//         return SmallTabletPortraitScreen();
//       } else if ((orientation == Orientation.portrait) && (width >= 834 && width <= 1024)) {
//         return TabletPortraitScreen();
//       } else if ((orientation == Orientation.landscape) && (width >= 1024 && width <= 1079)) {
//         return SmallTabletLandscapeScreen();
//       } else if ((orientation == Orientation.landscape) && (width >= 1133 && height <= 744)) {
//         return SmallTabletLandscapeScreen();
//       } else if ((orientation == Orientation.landscape) && (width >= 1080 && width <= 1366)) {
//         return TabletLandscapeScreen();
//       } else if ((orientation == Orientation.portrait) && (width >= 375 && height <= 667)) {
//         return SmallPhonePortraitScreen();
//       } else if ((orientation == Orientation.landscape) && (width >= 667 && height <= 375)) {
//         return SmallPhoneLandscapeScreen();
//       } else if ((orientation == Orientation.portrait) && (width >= 375 && width <= 430)) {
//         return PhonePortraitScreen();
//       } else if ((orientation == Orientation.landscape) && (width >= 480 && width <= 932)) {
//         return PhoneLandscapeScreen();
//       }
//     } else if (Platform.isWindows) {
//       debugPrint('Running on Windows');
//     } else if (Platform.isLinux) {
//       debugPrint('Running on Linux');
//     } else if (Platform.isMacOS) {
//       debugPrint('Running on macOS');
//     } else {
//       debugPrint('Running on an unknown platform');
//     }
//     return PhonePortraitScreen();
//   }
//
//   double selectTextSize() {
//     if (Platform.isAndroid) {
//       debugPrint('Running on Android');
//     } else if (Platform.isIOS) {
//       debugPrint('Running on iOS');
//       if ((orientation == Orientation.portrait) && (width >= 744 && width <= 833)) {
//         // SmallTabletPortraitScreen();
//         return fontSizeValue = 16.0;
//       } else if ((orientation == Orientation.portrait) && (width >= 834 && width <= 1024)) {
//         // TabletPortraitScreen();
//         return fontSizeValue = 20.0;
//       } else if ((orientation == Orientation.landscape) && (width >= 1024 && width <= 1079)) {
//         // SmallTabletLandscapeScreen();
//         return fontSizeValue = 30.0;
//       } else if ((orientation == Orientation.landscape) && (width >= 1133 && height <= 744)) {
//         // SmallTabletLandscapeScreen();
//         return fontSizeValue = 30.0;
//       } else if ((orientation == Orientation.landscape) && (width >= 1080 && width <= 1366)) {
//         // TabletLandscapeScreen();
//         return fontSizeValue = 30.0;
//       } else if ((orientation == Orientation.portrait) && (width >= 375 && height <= 667)) {
//         // SmallPhonePortraitScreen();
//         return fontSizeValue = 16.0;
//       } else if ((orientation == Orientation.landscape) && (width >= 667 && height <= 375)) {
//         // SmallPhoneLandscapeScreen();
//         return fontSizeValue = 16.0;
//       } else if ((orientation == Orientation.portrait) && (width >= 375 && width <= 430)) {
//         // PhonePortraitScreen();
//         return fontSizeValue = 16.0;
//       } else if ((orientation == Orientation.landscape) && (width >= 480 && width <= 932)) {
//         // PhoneLandscapeScreen();
//         return fontSizeValue = 20.0;
//       }
//     } else if (Platform.isWindows) {
//       debugPrint('Running on Windows');
//     } else if (Platform.isLinux) {
//       debugPrint('Running on Linux');
//     } else if (Platform.isMacOS) {
//       debugPrint('Running on macOS');
//     } else {
//       debugPrint('Running on an unknown platform');
//     }
//     return fontSizeValue;
//   }
//
//   double selectAppBarTextSize() {
//     if (Platform.isAndroid) {
//       debugPrint('Running on Android');
//     } else if (Platform.isIOS) {
//       debugPrint('Running on iOS');
//       if ((orientation == Orientation.portrait) && (width >= 744 && width <= 833)) {
//         // SmallTabletPortraitScreen();
//         return appBarTitleFontSize = 20.0;
//       } else if ((orientation == Orientation.portrait) && (width >= 834 && width <= 1024)) {
//         // TabletPortraitScreen();
//         return appBarTitleFontSize = 40.0;
//       } else if ((orientation == Orientation.landscape) && (width >= 1024 && width <= 1079)) {
//         // SmallTabletLandscapeScreen();
//         return appBarTitleFontSize = 35.0;
//       } else if ((orientation == Orientation.landscape) && (width >= 1133 && height <= 744)) {
//         // SmallTabletLandscapeScreen();
//         return appBarTitleFontSize = 40.0;
//       } else if ((orientation == Orientation.landscape) && (width >= 1080 && width <= 1366)) {
//         // TabletLandscapeScreen();
//         return appBarTitleFontSize = 35.0;
//       } else if ((orientation == Orientation.portrait) && (width >= 375 && height <= 667)) {
//         // SmallPhonePortraitScreen();
//         return appBarTitleFontSize = 20.0;
//       } else if ((orientation == Orientation.landscape) && (width >= 667 && height <= 375)) {
//         // SmallPhoneLandscapeScreen();
//         return appBarTitleFontSize = 25.0;
//       } else if ((orientation == Orientation.portrait) && (width >= 375 && width <= 430)) {
//         // PhonePortraitScreen();
//         return appBarTitleFontSize = 25.0;
//       } else if ((orientation == Orientation.landscape) && (width >= 480 && width <= 932)) {
//         // PhoneLandscapeScreen();
//         return appBarTitleFontSize = 30.0;
//       }
//     } else if (Platform.isWindows) {
//       debugPrint('Running on Windows');
//     } else if (Platform.isLinux) {
//       debugPrint('Running on Linux');
//     } else if (Platform.isMacOS) {
//       debugPrint('Running on macOS');
//     } else {
//       debugPrint('Running on an unknown platform');
//     }
//     return fontSizeValue;
//   }
// } //class

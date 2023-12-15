import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portsmouth_bloc/utilities/responsive_adaptive_class.dart';
import '../blocs/selection/selection_cubit.dart';
import 'data_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ResponsiveAdaptiveClass responsiveAdaptiveClass = ResponsiveAdaptiveClass();
  var orientation, size, height, width;
  double fontSizeValue = 0.0;
  double classFontSize = 0.0;
  double appBarTitleFontSize = 0.0;
  double elevatedButtonWidth = 0.0;
  double elevatedButtonHeight = 0.0;
  double classImageHeight = 0.0;
  double classImageWidth = 0.0;
  final classDataName = <String>['centerboard', 'keelboat', 'multihull', 'offshore'];
  final classImage = <String>[
    'assets/images/y-flyer.png',
    'assets/images/star.png',
    'assets/images/hobie_cat_16.png',
    'assets/images/j22.png',
  ];
  final classNames = <String>[
    'Centerboard Class',
    'Keelboat Class',
    'Multihull Class',
    'Offshore Class',
  ];
  @override
  Widget build(BuildContext context) {
    responsiveAdaptiveClass.orientation = MediaQuery.of(context).orientation;
    responsiveAdaptiveClass.size = MediaQuery.of(context).size;
    responsiveAdaptiveClass.height = responsiveAdaptiveClass.size.height;
    responsiveAdaptiveClass.width = responsiveAdaptiveClass.size.width;
    debugPrint(
        'HomeScreen orientation: ${MediaQuery.of(context).orientation}\nHeight: ${responsiveAdaptiveClass.size.height}\nWidth: ${responsiveAdaptiveClass.size.width}');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.description_outlined,
            // color: Colors.white,
          ),
          // iconSize: 40.0,
          onPressed: () => context.go('/definition_screen'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              // color: Colors.white,
            ),
            onPressed: () => context.go('/settings_screen'),
          ),
        ],
        centerTitle: true,
        title: Text(
          'One-Design Sailboat DB',
          style: TextStyle(
              fontSize: responsiveAdaptiveClass.appBarTitleFontSize =
                  responsiveAdaptiveClass.selectAppBarTitleFontSize()),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ocean_background.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 1.0,
            image: AssetImage('assets/images/yflyerBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: classNames.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonWidth(),
                  height: responsiveAdaptiveClass.elevatedButtonWidth =
                      responsiveAdaptiveClass.selectElevatedButtonHeight(),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFDAFFFB),
                        Color(0xFF176B87),
                      ],
                      stops: [0.0, 1.0],
                    ),
                    // color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<SelectionCubit>().setSelectionClassChoice(classDataName[index]);
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DataListScreen(),
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        // fixedSize: Size((width * 0.75), (height / 5.5)),
                        fixedSize: Size(
                            responsiveAdaptiveClass.elevatedButtonWidth =
                                responsiveAdaptiveClass.selectElevatedButtonWidth(),
                            responsiveAdaptiveClass.elevatedButtonHeight =
                                responsiveAdaptiveClass.selectElevatedButtonHeight()),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 3.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        backgroundColor: Colors.transparent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                          child: Image.asset(
                            classImage[index],
                            height: classImageHeight =
                                responsiveAdaptiveClass.selectClassImageHeight(),
                            width: classImageWidth =
                                responsiveAdaptiveClass.selectClassImageWidth(),
                            fit: BoxFit.fill,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          classNames[index],
                          // overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          // softWrap: true,
                          style: TextStyle(
                              fontSize: responsiveAdaptiveClass.classFontSize =
                                  responsiveAdaptiveClass.selectFontSize(),
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } //Widget Build
} //class

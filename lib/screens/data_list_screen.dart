// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portsmouth_bloc/blocs/data_cubit/data_cubit.dart';
import 'package:portsmouth_bloc/blocs/selection/selection_cubit.dart';
import 'package:portsmouth_bloc/screens/search_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/data_model.dart';

class DataListScreen extends StatefulWidget {
  DataListScreen({super.key});

  @override
  _DataListScreenState createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  var orientation, size, height, width;
  double fontSizeValue = 0.0;
  late DataListScreen dataListScreen;
  DataModel dataModel = DataModel();
  @override
  void initState() {
    fontSizeValue = selectTextSize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    debugPrint('Size: $size');
    height = size.height;
    debugPrint('Height: $height');
    width = size.width;
    debugPrint('Width: $width');
    return BlocBuilder<SelectionCubit, SelectionState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                textLabel(),
                style: TextStyle(
                  fontSize: fontSizeValue = selectTextSize(),
                  color: Colors.white,
                ),
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  SearchData(),
                  // SelectionScreen(),
                  BlocBuilder<DataCubit, DataState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ErrorState) {
                        return Center(
                          child: Text(
                            'Network Error: Check Signal',
                            style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                          ),
                        );
                      } else if (state is LoadedState) {
                        fontSizeValue = selectTextSize();
                        final centerboardListValue = state.centerboard;
                        debugPrint('centerboardListValue.length: ${centerboardListValue.length}');
                        return Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: centerboardListValue.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  elevation: 10.0,
                                  color: Colors.lightBlueAccent,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: width * .25,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 4.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'Boat: the name of the boat given by the manufacturer and/or class association.',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'Boat: ${centerboardListValue[index].boat}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                    getDivider(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'Dixie Portsmouth Numbers or D-PN: A boat assigned D-PN=80 will sail the same distance in 80 minutes as a boat assigned DPN=90 will sail in 90 minutes.',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'DPN: ${centerboardListValue[index].dpn}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                    getDivider(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // debugPrint('Website URL Test');
                                                        _launchURLBrowser(
                                                            centerboardListValue[index]
                                                                .website
                                                                .toString());
                                                      },
                                                      child: Text(
                                                        'Click for Website',
                                                        style: TextStyle(
                                                          color: Colors.purple,
                                                          fontSize: fontSizeValue =
                                                              selectTextSize(),
                                                          fontWeight: FontWeight.normal,
                                                        ),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                    getDivider(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'One Design: a form of racing where all boats are virtually identical or similar in design. Class-legal boats race each other without any handicap calculations, start at the same time, and the winner is the first to cross the finish line.',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'One Design: ${centerboardListValue[index].oneDesign}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(
                                              // width: 10,
                                              thickness: 2,
                                              indent: 0,
                                              endIndent: 0,
                                              color: Colors.black,
                                            ),
                                            Container(
                                              width: width * .25,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 4.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'Crew: number of crew members needed to race the sailboat. Examples: single handed or solo for one skipper and double-handed for a skipper and one crew.',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'Crew: ${centerboardListValue[index].crewSize}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                    getDivider(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'LOA: length over all may include railing, bowsprits, and other features of the boat.',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'LOA: ${centerboardListValue[index].loa}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                    getDivider(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'Sail Area. The total combined area of the sails when sailing upwind. S.A. (reported) is the area reported by the builder.',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'SA: ${centerboardListValue[index].sailArea}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                    getDivider(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'SA/Disp: A sail area/displacement ratio below 16 would be considered under powered; 16 to 20 would indicate reasonably good performance; above 20 suggests relatively high performance.',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'SA/Disp: ${centerboardListValue[index].saDisp}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(
                                              // width: 10,
                                              thickness: 2,
                                              indent: 0,
                                              endIndent: 0,
                                              color: Colors.black,
                                            ),
                                            Container(
                                              width: width * .25,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 4.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'Beam: this is the greatest width of the hull and is often expressed as Beam (Max).',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'Beam: ${centerboardListValue[index].beam}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                    getDivider(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'Displacement: when you weigh the boat on a scale, that is her actual displacement.',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'Disp: ${centerboardListValue[index].displacement}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                    getDivider(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'Disp/Len: The lower a boat’s Displacement/Length (LWL) ratio, the less power it takes to drive the boat to its nominal hull speed. Less than 100 = Ultralight; 100-200 = Light; 200-275 = Moderate.',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'Disp/Len: ${centerboardListValue[index].dispLen}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                    getDivider(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        final snackBar = SnackBar(
                                                          duration: Duration(seconds: 6),
                                                          content: const Text(
                                                            'Hull SP: The maximum speed of a displacement hull (referring to a hull that travels through the water rather than on top of it, e.g. planing).',
                                                            style: TextStyle(fontSize: 30.0),
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(snackBar);
                                                      },
                                                      child: Text(
                                                        'Hull SP: ${centerboardListValue[index].hullSpeed}',
                                                        style: TextStyle(
                                                            fontSize: fontSizeValue =
                                                                selectTextSize(),
                                                            fontWeight: FontWeight.bold),
                                                        // style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  } //Widget

  String textLabel() {
    String tempValue = context.watch<SelectionCubit>().state.selectionClassChoice.name;
    // debugPrint('This is a test of printing the DataModel toString: $dataModel');
    if (tempValue == 'centerboard') {
      tempValue = 'Centerboard Class';
    } else if (tempValue == 'keelboat') {
      tempValue = 'Keelboat Class';
    } else if (tempValue == 'multihull') {
      tempValue = 'Multihull Class';
    } else {
      tempValue = 'Offshore (Cruiser) Class';
    }
    return tempValue;
  }

  double selectTextSize() {
    if (Platform.isAndroid) {
      // debugPrint('Running on Android');
    } else if (Platform.isIOS) {
      // debugPrint('Running on iOS');
      if ((orientation == Orientation.portrait) && (width >= 744 && width <= 833)) {
        // SmallTabletPortraitScreen();
        return fontSizeValue = 16.0;
      } else if ((orientation == Orientation.portrait) && (width >= 834 && width <= 1024)) {
        // TabletPortraitScreen();
        return fontSizeValue = 20.0;
      } else if ((orientation == Orientation.landscape) && (width >= 1024 && width <= 1079)) {
        // SmallTabletLandscapeScreen();
        return fontSizeValue = 30.0;
      } else if ((orientation == Orientation.landscape) && (width >= 1133 && height <= 744)) {
        // SmallTabletLandscapeScreen();
        return fontSizeValue = 30.0;
      } else if ((orientation == Orientation.landscape) && (width >= 1080 && width <= 1366)) {
        // TabletLandscapeScreen();
        return fontSizeValue = 30.0;
      } else if ((orientation == Orientation.portrait) && (width >= 375 && height <= 667)) {
        // SmallPhonePortraitScreen();
        return fontSizeValue = 16.0;
      } else if ((orientation == Orientation.landscape) && (width >= 667 && height <= 375)) {
        // SmallPhoneLandscapeScreen();
        return fontSizeValue = 16.0;
      } else if ((orientation == Orientation.portrait) && (width >= 375 && width <= 430)) {
        // PhonePortraitScreen();
        return fontSizeValue = 16.0;
      } else if ((orientation == Orientation.landscape) && (width >= 480 && width <= 932)) {
        // PhoneLandscapeScreen();
        return fontSizeValue = 20.0;
      }
    } else if (Platform.isWindows) {
      debugPrint('Running on Windows');
    } else if (Platform.isLinux) {
      debugPrint('Running on Linux');
    } else if (Platform.isMacOS) {
      debugPrint('Running on macOS');
    } else {
      debugPrint('Running on an unknown platform');
    }
    return fontSizeValue;
  }

  void _launchURLBrowser(String urlString) async {
    var url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    } //else
  }

  Widget getDivider() {
    return Divider(
      height: 20,
      thickness: 2,
      indent: 0.0,
      endIndent: 0.0,
      color: Colors.white,
    );
  }
} //class

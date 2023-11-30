import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/selection/selection_cubit.dart';
import 'data_list_screen.dart';

enum Selections { centerboard, keelboat, multihull, offshore }

class SmallPhonePortraitScreen extends StatefulWidget {
  const SmallPhonePortraitScreen({super.key});

  @override
  State<SmallPhonePortraitScreen> createState() => _SmallPhonePortraitScreenState();
}

class _SmallPhonePortraitScreenState extends State<SmallPhonePortraitScreen> {
  Selections? _selections;
  var orientation, size, height, width;

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
    return Container(
      width: width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Text(
          //   'Small Phone Portrait Screen',
          //   style: TextStyle(fontSize: 20.0, color: Colors.black),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RadioListTile<Selections>(
              toggleable: true,
              tileColor: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 4),
                borderRadius: BorderRadius.circular(20),
              ),
              value: Selections.centerboard,
              groupValue: _selections,
              onChanged: (Selections? value) {
                context.read<SelectionCubit>().setSelectionClassChoice('centerboard');
                setState(() {
                  _selections = value;
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DataListScreen()));
                });
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  Image.asset(
                    'assets/images/y-flyer.png',
                    height: height * 0.1,
                    width: height * 0.1,
                    fit: BoxFit.fill,
                  ),
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  Text(
                    'Centerboard Class',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  // Text('TP'),
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  // Image.asset(
                  //   'assets/images/470.png',
                  //   height: height * 0.1,
                  //   width: height * 0.1,
                  //   fit: BoxFit.fill,
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RadioListTile<Selections>(
              toggleable: true,
              tileColor: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 4.0),
                borderRadius: BorderRadius.circular(20),
              ),
              value: Selections.keelboat,
              groupValue: _selections,
              onChanged: (Selections? value) {
                context.read<SelectionCubit>().setSelectionClassChoice('keelboat');
                setState(() {
                  _selections = value;
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DataListScreen()));
                });
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  Image.asset(
                    'assets/images/star.png',
                    height: height * 0.1,
                    width: height * 0.1,
                    fit: BoxFit.fill,
                  ),
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  Text(
                    'Keelboat Class',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  // Image.asset(
                  //   'assets/images/sonar.png',
                  //   height: height * 0.1,
                  //   width: height * 0.1,
                  //   fit: BoxFit.fill,
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RadioListTile<Selections>(
              dense: false,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              toggleable: true,
              tileColor: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 4.0),
                borderRadius: BorderRadius.circular(20),
              ),
              value: Selections.multihull,
              groupValue: _selections,
              onChanged: (Selections? value) {
                context.read<SelectionCubit>().setSelectionClassChoice('multihull');
                setState(() {
                  _selections = value;
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DataListScreen()));
                });
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  Image.asset(
                    'assets/images/hobie_cat_16.png',
                    height: height * 0.1,
                    width: height * 0.1,
                    fit: BoxFit.fill,
                  ),
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  Text(
                    'Multihull Class',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  // Image.asset(
                  //   'assets/images/weta.png',
                  //   height: height * 0.1,
                  //   width: height * 0.1,
                  //   fit: BoxFit.fill,
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RadioListTile<Selections>(
              dense: false,
              toggleable: true,
              tileColor: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 4.0),
                borderRadius: BorderRadius.circular(20),
              ),
              value: Selections.offshore,
              groupValue: _selections,
              onChanged: (Selections? value) {
                context.read<SelectionCubit>().setSelectionClassChoice('offshore');
                setState(() {
                  _selections = value;
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DataListScreen()));
                });
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  Image.asset(
                    'assets/images/j22.png',
                    color: Colors.black,
                    height: height * 0.1,
                    width: height * 0.1,
                    fit: BoxFit.fill,
                  ),
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  Text(
                    'Offshore Class',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  // SizedBox(
                  //   width: width * 0.08,
                  // ),
                  // Image.asset(
                  //   'assets/images/melges24.png',
                  //   height: height * 0.1,
                  //   width: height * 0.1,
                  //   fit: BoxFit.fill,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} // class

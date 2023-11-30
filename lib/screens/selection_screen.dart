import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/selection/selection_cubit.dart';
import 'data_list_screen.dart';

enum Selections { centerboard, keelboat, multihull, offshore }

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  Selections? _selections;
  var orientation, size, height, width;

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    // debugPrint('Orientation: $orientation');
    size = MediaQuery.of(context).size;
    // debugPrint('Size: $size');
    height = size.height;
    // debugPrint('Height: $height');
    width = size.width;
    // debugPrint('Width: $width');
    return SafeArea(
      child: Container(
        width: width * 1,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioListTile<Selections>(
                toggleable: true,
                tileColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
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
                  children: [
                    Image.asset(
                      'assets/images/y-flyer.png',
                      height: height * 0.09,
                      width: height * 0.09,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      'Centerboard Class',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
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
                  side: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
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
                  children: [
                    Image.asset(
                      'assets/images/star.png',
                      height: height * 0.09,
                      width: height * 0.09,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      'Keelboat Class',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
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
                  side: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
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
                  children: [
                    Image.asset(
                      'assets/images/hobie_cat_16.png',
                      height: height * 0.09,
                      width: height * 0.09,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      'Multihull Class',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
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
                  side: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
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
                  children: [
                    Image.asset(
                      'assets/images/j22.png',
                      color: Colors.black,
                      height: height * 0.09,
                      width: height * 0.09,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      'Offshore Class',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} // class

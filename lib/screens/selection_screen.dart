import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:portsmouth_bloc/screens/data_table_list_screen.dart';
// import 'package:go_router/go_router.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          RadioListTile<Selections>(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataListScreen()));
              });
            },
            title: Row(
              children: [
                Image.asset(
                  'assets/images/y-flyer.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  'Select Centerboard Class',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          RadioListTile<Selections>(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataListScreen()));
              });
            },
            title: Row(
              children: [
                Image.asset(
                  'assets/images/star.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  'Select Keelboat Class',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          RadioListTile<Selections>(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataListScreen()));
              });
            },
            title: Row(
              children: [
                Image.asset(
                  'assets/images/hobie_cat_16.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  'Select Multihull Class',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          RadioListTile<Selections>(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataListScreen()));
              });
            },
            title: Row(
              children: [
                Image.asset(
                  'assets/images/j22.png',
                  color: Colors.black,
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  'Select Offshore Class',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => DataTableListScreen(),
          //       ),
          //     );
          //   },
          //   child: Text('Test'),
          // ),
        ],
      ),
    );
  }

  // _detectOnTapMethodWithoutString() {
  //   context.go('/');
  // }
}

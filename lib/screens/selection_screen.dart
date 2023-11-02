import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Selections { centerboard, keelboat, multihull, offshore }

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  Selections? _selections = Selections.centerboard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<Selections>(
          value: Selections.centerboard,
          groupValue: _selections,
          onChanged: (Selections? value) {},
          title: Text('Centerboard'),
          subtitle: Text('Select the Centerboard Class'),
        ),
      ],
    );
  }
}

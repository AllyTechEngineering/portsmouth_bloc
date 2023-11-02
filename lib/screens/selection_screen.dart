import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/selection/selection_cubit.dart';

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
          onChanged: (Selections? value) {
            context
                .read<SelectionCubit>()
                .setSelectionClassChoice('centerboard');
            setState(() {
              _selections = value;
            });
          },
          title: Text('Select Centerboard Class'),
        ),
        RadioListTile<Selections>(
          value: Selections.keelboat,
          groupValue: _selections,
          onChanged: (Selections? value) {
            context.read<SelectionCubit>().setSelectionClassChoice('keelboat');
            setState(() {
              _selections = value;
            });
          },
          title: Text('Select Keelboat Class'),
        ),
        RadioListTile<Selections>(
          value: Selections.multihull,
          groupValue: _selections,
          onChanged: (Selections? value) {
            context.read<SelectionCubit>().setSelectionClassChoice('multihull');
            setState(() {
              _selections = value;
            });
          },
          title: Text('Select Multihull Class'),
        ),
        RadioListTile<Selections>(
          value: Selections.offshore,
          groupValue: _selections,
          onChanged: (Selections? value) {
            context.read<SelectionCubit>().setSelectionClassChoice('offshore');
            setState(() {
              _selections = value;
            });
          },
          title: Text('Select Offshore Class'),
        ),
      ],
    );
  }
}

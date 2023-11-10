import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portsmouth_bloc/blocs/search/search_cubit.dart';

class SearchData extends StatefulWidget {
  const SearchData({super.key});

  @override
  State<SearchData> createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  TextEditingController controller = TextEditingController();
  String? _newSearchTerm = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Search...',
              border: InputBorder.none,
              filled: true,
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              _newSearchTerm = value;
              if (_newSearchTerm != null) {
                // print('In if newSearchTerm: $newSearchTerm');
                context.read<SearchCubit>().setSearchTerm(_newSearchTerm!);
              }
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                controller.clear();
                _newSearchTerm = '';
              });
            },
          ),
        ),
      ],
    );
  }
}

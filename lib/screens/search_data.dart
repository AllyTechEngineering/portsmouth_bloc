import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portsmouth_bloc/blocs/search/search_cubit.dart';

class SearchData extends StatefulWidget {
  const SearchData({super.key});

  @override
  State<SearchData> createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  var orientation, size, height, width;
  TextEditingController controller = TextEditingController();
  String? _newSearchTerm = '';
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 1.0),
        child: ListTile(
          title: TextField(
            cursorColor: Colors.white,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(width: 4.0, color: Colors.black),
              ),
              hintStyle: Theme.of(context).textTheme.displayLarge,
              hintText: 'Use lower case for search...',
              prefixIcon: Icon(
                Icons.search,
                // size: height * 0.08,
              ),
            ),
            onChanged: (value) {
              _newSearchTerm = value;
              if (_newSearchTerm != null) {
                context.read<SearchCubit>().setSearchTerm(_newSearchTerm!);
              }
            },
          ),
          trailing: IconButton(
            visualDensity: VisualDensity.standard,
            focusColor: Colors.cyanAccent.withOpacity(0.3),
            hoverColor: Colors.redAccent.withOpacity(0.3),
            highlightColor: Colors.lime,
            splashColor: Colors.amber,
            icon: Icon(
              Icons.delete_forever,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              setState(() {
                controller.clear();
                _newSearchTerm = '';
                context.read<SearchCubit>().setSearchTerm(_newSearchTerm!);
              });
            },
          ),
        ),
      ),
    );
  }
}

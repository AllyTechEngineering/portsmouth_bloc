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
    // orientation = MediaQuery.of(context).orientation;
    // print('Orientation: $orientation');
    // size = MediaQuery.of(context).size;
    // print('Size: $size');
    // height = size.height;
    // print('Height: $height');
    // width = size.width;
    // print('Width: $width');
    return Container(
      // height: height * 0.25,
      // width: width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: TextField(
            cursorColor: Colors.white,
            controller: controller,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.displayLarge,
              hintText: 'Search...',
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
            icon: Icon(
              Icons.cancel,
              color: Colors.white,
              // size: height * 0.08,
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

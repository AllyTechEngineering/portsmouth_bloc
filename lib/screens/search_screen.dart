import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portsmouth_bloc/blocs/search/search_cubit.dart';

class SearchData extends StatelessWidget {
  const SearchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Search...',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              // print('In if newSearchTerm: $newSearchTerm');
              context.read<SearchCubit>().setSearchTerm(newSearchTerm);
            }
          },
        ),
      ],
    );
  }
}
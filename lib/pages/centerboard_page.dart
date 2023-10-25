import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portsmouth_bloc/blocs/centerboard/centerboard_cubit.dart';

import '../blocs/search/search_cubit.dart';

class CenterboardScreen extends StatefulWidget {
  @override
  _CenterboardScreenState createState() => _CenterboardScreenState();
}

class _CenterboardScreenState extends State<CenterboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            labelText: 'Search',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: false,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              context.read<SearchCubit>().setSearchTerm(newSearchTerm);
            }
          },
        ),
      ),
      body: BlocBuilder<CenterboardCubit, CenterboardState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(
                Icons.error_outlined,
                size: 150,
                color: Colors.red,
              ),
            );
          } else if (state is LoadedState) {
            final centerboardListValue = state.centerboard;
            print('Test of list: ${centerboardListValue[0].title} ');

            return ListView.builder(
              itemCount: centerboardListValue.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  isThreeLine: true,
                  title: Text(
                    centerboardListValue[index].title,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  subtitle: Text(
                    centerboardListValue[index].dpn,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Container(
                    width: 100.0,
                    height: 40.0,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Name:',
                            style: TextStyle(fontSize: 8.0),
                          ),
                          Text(
                            'DPN:',
                            style: TextStyle(fontSize: 8.0),
                          ),
                          Text(
                            centerboardListValue[index].loa,
                            style: TextStyle(fontSize: 8.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Image.asset(
                  //   'lib/images/boat_name.png',
                  //   scale: 1,
                  //   height: 50.0,
                  //   width: 50.0,
                  // ),
                  // CircleAvatar(
                  //     // backgroundImage: NetworkImage(movies[index].urlImage),
                  //     ),
                  // ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
} //class

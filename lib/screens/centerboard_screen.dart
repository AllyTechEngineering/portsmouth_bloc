import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portsmouth_bloc/blocs/centerboard/centerboard_cubit.dart';
import 'package:portsmouth_bloc/screens/search_screen.dart';

class CenterboardScreen extends StatefulWidget {
  @override
  _CenterboardScreenState createState() => _CenterboardScreenState();
}

class _CenterboardScreenState extends State<CenterboardScreen> {
  var items = <String>[];
  List<String> filteredItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Centerboard')),
      body: Container(
        child: Column(
          children: [
            SearchData(),
            BlocBuilder<CenterboardCubit, CenterboardState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ErrorState) {
                  return Center(
                    child: Text(
                      'Network Error: Check Signal',
                      style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                    ),
                  );
                } else if (state is LoadedState) {
                  final centerboardListValue = state.centerboard;
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: centerboardListValue.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          isThreeLine: false,
                          title: Text(
                            centerboardListValue[index].boat,
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
                            height: 50.0,
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Name:',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Text(
                                    'DPN:',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  // Text(
                                  //   centerboardListValue[index].loa,
                                  //   style: TextStyle(fontSize: 8.0),
                                  // ),
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
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  } //Widget
} //class

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portsmouth_bloc/blocs/cubit/centerboard_cubit.dart';
import 'package:portsmouth_bloc/repositories/centerboard_repository.dart';

class CenterboardScreen extends StatefulWidget {
  @override
  _CenterboardScreenState createState() => _CenterboardScreenState();
}

class _CenterboardScreenState extends State<CenterboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CenterboardCubit>(
      create: (context) => CenterboardCubit(
        repository: CenterboardRepository(
          Dio(),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Portsmouth Centerboard DPN'),
        ),
        body: BlocBuilder<CenterboardCubit, CenterboardState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Icon(Icons.close),
              );
            } else if (state is LoadedState) {
              final centerboardListValue = state.centerboard;
              print('Test of list: ${centerboardListValue[0].title} ');

              return ListView.builder(
                itemCount: centerboardListValue.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    isThreeLine: false,
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
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Text(
                              'DPN:',
                              style: TextStyle(fontSize: 14.0),
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
      ),
    );
  }
} //class

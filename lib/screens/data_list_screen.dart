import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portsmouth_bloc/blocs/data_cubit/data_cubit.dart';
import 'package:portsmouth_bloc/blocs/selection/selection_cubit.dart';
import 'package:portsmouth_bloc/screens/search_screen.dart';

import '../models/data_model.dart';

class DataListScreen extends StatefulWidget {
  DataListScreen({super.key});

  @override
  _DataListScreenState createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  var orientation, size, height, width;
  late DataListScreen dataListScreen;
  DataModel dataModel = DataModel();

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    print('Orientation: $orientation');
    size = MediaQuery.of(context).size;
    print('Size: $size');
    height = size.height;
    print('Height: $height');
    width = size.width;
    print('Width: $width');
    return BlocBuilder<SelectionCubit, SelectionState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(textLabel()),
            ),
            body: Container(
              child: Column(
                children: [
                  SearchData(),
                  // SelectionScreen(),
                  BlocBuilder<DataCubit, DataState>(
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
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Container(
                                      width: width * .25,
                                      child: Column(
                                        children: [
                                          Text(
                                            'Boat: ${centerboardListValue[index].boat}',
                                            style: TextStyle(color: Colors.black, fontSize: 10.0),
                                          ),
                                          Text(
                                            'Sail Area: ${centerboardListValue[index].sailArea}',
                                            style: TextStyle(color: Colors.black, fontSize: 10.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: width * .25,
                                      child: Column(
                                        children: [
                                          Text(
                                            'DPN: ${centerboardListValue[index].dpn}',
                                            style: TextStyle(color: Colors.black, fontSize: 10.0),
                                          ),
                                          Text(
                                            'Crew Size: ${centerboardListValue[index].crewSize}',
                                            style: TextStyle(color: Colors.black, fontSize: 10.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: width * .25,
                                      child: Column(
                                        children: [
                                          Text(
                                            'LOA: ${centerboardListValue[index].loa}',
                                            style: TextStyle(color: Colors.black, fontSize: 10.0),
                                          ),
                                          Text(
                                            'Disp: ${centerboardListValue[index].displacement}',
                                            style: TextStyle(color: Colors.black, fontSize: 10.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                                // ListTile(
                                //   isThreeLine: false,
                                //   title: Text(
                                //     centerboardListValue[index].boat,
                                //     // style: TextStyle(
                                //     //   fontSize: 14.0,
                                //     // ),
                                //   ),
                                //   subtitle: Text(
                                //     centerboardListValue[index].dpn,
                                //     // style: TextStyle(
                                //     //   fontSize: 14.0,
                                //     //   fontWeight: FontWeight.bold,
                                //     // ),
                                //   ),
                                //   leading: Container(
                                //     width: 100.0,
                                //     height: 50.0,
                                //     child: Center(
                                //       child: Column(
                                //         children: [
                                //           SizedBox(height: 10.0),
                                //           Text(
                                //             'Name:',
                                //             // style: TextStyle(fontSize: 12.0),
                                //           ),
                                //           Text(
                                //             'DPN:',
                                //             // style: TextStyle(fontSize: 12.0),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
          ),
        );
      },
    );
  } //Widget

  String textLabel() {
    String tempValue = context.watch<SelectionCubit>().state.selectionClassChoice.name;
    print('This is a test of printing the DataModel toString: $dataModel');
    if (tempValue == 'centerboard') {
      tempValue = 'Centerboard Class';
    } else if (tempValue == 'keelboat') {
      tempValue = 'Keelboat Class';
    } else if (tempValue == 'multihull') {
      tempValue = 'Multihull Class';
    } else {
      tempValue = 'Offshore (Crusier) Class';
    }
    return tempValue;
  }
} //class

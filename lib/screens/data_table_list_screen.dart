// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../blocs/data_cubit/data_cubit.dart';
// import '../blocs/selection/selection_cubit.dart';
// import '../models/data_class.dart';
//
// class DataTableListScreen extends StatefulWidget {
//   const DataTableListScreen({super.key});
//
//   @override
//   State<DataTableListScreen> createState() => _DataTableListScreenState();
// }
//
// class _DataTableListScreenState extends State<DataTableListScreen> {
//   List<DataClass> users = [
//     DataClass(boat: 'Sarah', dpn: '19', sailArea: 'Student', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2'),
//     DataClass(boat: 'Janine', dpn: '43', sailArea: 'Professor', loa: '12.75', crewSize: '2')
//   ];
//
//   List<DataClass> usersFiltered = [];
//   TextEditingController controller = TextEditingController();
//   String _searchResult = '';
//   @override
//   void initState() {
//     super.initState();
//     usersFiltered = users;
//   }
//
//   var orientation, size, height, width;
//   @override
//   Widget build(BuildContext context) {
//     orientation = MediaQuery.of(context).orientation;
//     print('Orientation: $orientation');
//     size = MediaQuery.of(context).size;
//     print('Size: $size');
//     height = size.height;
//     print('Height: $height');
//     width = size.width;
//     print('Width: $width');
//     return BlocBuilder<SelectionCubit, SelectionState>(
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Test Page'),
//           ),
//           resizeToAvoidBottomInset: false,
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Card(
//                   child: ListTile(
//                     leading: Icon(Icons.search),
//                     title: TextField(
//                         controller: controller,
//                         decoration: InputDecoration(hintText: 'Search', border: InputBorder.none),
//                         onChanged: (value) {
//                           setState(() {
//                             _searchResult = value;
//                             usersFiltered = users
//                                 .where((user) =>
//                                     user.boat.contains(_searchResult) ||
//                                     user.sailArea.contains(_searchResult) ||
//                                     user.dpn.contains(_searchResult))
//                                 .toList();
//                           });
//                         }),
//                     trailing: IconButton(
//                       icon: Icon(Icons.cancel),
//                       onPressed: () {
//                         setState(() {
//                           controller.clear();
//                           _searchResult = '';
//                           usersFiltered = users;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * .75,
//                   child: BlocBuilder<DataCubit, DataState>(
//                     builder: (context, state) {
//                       if (state is LoadingState) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       } else if (state is ErrorState) {
//                         return Center(
//                           child: Text(
//                             'Network Error: Check Signal',
//                             style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
//                           ),
//                         );
//                       } else if (state is LoadedState) {
//                         final centerboardListValue = state.centerboard;
//                         print('Test print of crewSize: ${centerboardListValue[0].dpn}');
//                         return SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: DataTable(
//                               columns: const <DataColumn>[
//                                 DataColumn(
//                                   label: Text(
//                                     'Boat',
//                                     style: TextStyle(fontStyle: FontStyle.italic),
//                                   ),
//                                 ),
//                                 DataColumn(
//                                   label: Text(
//                                     'DPN',
//                                     style: TextStyle(fontStyle: FontStyle.italic),
//                                   ),
//                                 ),
//                                 DataColumn(
//                                   label: Text(
//                                     'Sail Area',
//                                     style: TextStyle(fontStyle: FontStyle.italic),
//                                   ),
//                                 ),
//                                 DataColumn(
//                                   label: Text(
//                                     'LOA',
//                                     style: TextStyle(fontStyle: FontStyle.italic),
//                                   ),
//                                 ),
//                                 DataColumn(
//                                   label: Text(
//                                     'Crew',
//                                     style: TextStyle(fontStyle: FontStyle.italic),
//                                   ),
//                                 ),
//                               ],
//                               rows: List.generate(
//                                 centerboardListValue.length,
//                                 (index) => DataRow(
//                                   cells: <DataCell>[
//                                     DataCell(Text(centerboardListValue[index].boat)),
//                                     DataCell(Text(centerboardListValue[index].dpn)),
//                                     DataCell(Text(centerboardListValue[index].sailArea)),
//                                     DataCell(Text(centerboardListValue[index].loa)),
//                                     DataCell(Text(centerboardListValue[index].crewSize)),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       } else
//                         return Container();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

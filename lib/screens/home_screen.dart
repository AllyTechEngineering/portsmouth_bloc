import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portsmouth_bloc/screens/selection_screen.dart';

// import '../utilities/constants.dart';
import '../utilities/portsmouth_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var categoriesClass = CategoriesClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.description_outlined,
            // color: Colors.white,
          ),
          // iconSize: 40.0,
          onPressed: () => context.go('/definition_screen'),
        ),
        centerTitle: true,
        // backgroundColor: Colors.blueAccent,
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Racing Sailboat Bible',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              // color: Colors.white,
            ),
            onPressed: () => context.go('/settings_screen'),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SelectionScreen(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } //Widget
} //class

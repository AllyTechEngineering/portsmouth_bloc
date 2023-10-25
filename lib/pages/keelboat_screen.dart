import 'package:flutter/material.dart';

class KeelboatScreen extends StatefulWidget {
  const KeelboatScreen({super.key});

  @override
  State<KeelboatScreen> createState() => _KeelboatScreenState();
}

class _KeelboatScreenState extends State<KeelboatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keelboat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Keelboat Screen'),
          ],
        ),
      ),
    );
  }
}

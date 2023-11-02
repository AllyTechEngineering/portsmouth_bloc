import 'package:flutter/material.dart';

class OffshoreScreen extends StatefulWidget {
  const OffshoreScreen({super.key});

  @override
  State<OffshoreScreen> createState() => _OffshoreScreenState();
}

class _OffshoreScreenState extends State<OffshoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offshore'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Offshore Screen'),
          ],
        ),
      ),
    );
  }
}

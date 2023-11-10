import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portsmouth_bloc/utilities/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final UrlLauncher urlLauncher;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
          ),
          onPressed: () => context.go('/'),
        ),
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'About the Developer',
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 50.0,
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          _launchURLBrowser('https://allytechllc.com/privacy');
                        },
                        child: Text('Privacy'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 50.0,
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          _launchURLBrowser('https://www.linkedin.com/in/bob-taylor-mscs-mba/');
                        },
                        child: Text('App Developer'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 50.0,
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          _launchURLBrowser('https://allytechllc.com/contact-us');
                        },
                        child: Text('Contact Us'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 50.0,
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          _launchURLBrowser('https://allytechllc.com/about-us');
                        },
                        child: Text('About Us'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 50.0,
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          _launchURLBrowser('https://allytechllc.com/portfolio');
                        },
                        child: Text('Portfolio'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          // child: ElevatedButton(
          //   onPressed: () => context.go('/'),
          //   child: const Text('Go back to the Home screen'),
          // ),
        ),
      ),
    );
  }

  _launchURLBrowser(String urlValue) async {
    var url = Uri.parse(urlValue);
    if (await canLaunchUrl(url)) {
      print('Inside of if means canLaunchUrl ok');
      await launchUrl(url);
    } else {
      print('After the else means an error: $url');
      throw 'Could not launch $url';
    } //else
  } //_launchURLBrowser
}

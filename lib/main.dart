import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_meet_ui/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(
          focusColor: Colors.blue[800],
          primaryIconTheme: IconThemeData(
            color: Colors.grey[700],
          )),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

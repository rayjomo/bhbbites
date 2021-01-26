import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'package:bhbbites/views/launch_view.dart';


void main()
{ runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'Baby Healthy Bites',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    //    home: Home(),
        home: LaunchView(),
        routes: <String, WidgetBuilder> {
        '/signUp': (BuildContext context) => Home(),
          '/home': (BuildContext context) => Home(),

        }

       );

  }
}


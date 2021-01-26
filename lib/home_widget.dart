import 'package:flutter/material.dart';
import 'pages.dart';
import 'views/home_view.dart';

  class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  int _currentIndex =0;
  final List<Widget> _children = [
    HomeView(),
    Recipepage(),
    Tipspage()
  ];

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baby Healthy Bites")
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTabbed,
        currentIndex: _currentIndex ,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.fastfood),
            title: new Text("Recipes"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.privacy_tip_sharp),
            title: new Text("Tips"),
          ),
        ]
      ),
    );

  }

  void onTabTabbed(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
import 'package:bhbbites/services/auth_service.dart';
import 'package:bhbbites/views/baby_prefrences/babybio_view.dart';
import 'package:bhbbites/views/dashboard_view.dart';
import 'package:bhbbites/views/baby_prefrences/babybio_view.dart';
import 'package:flutter/material.dart';
import 'pages.dart';
import 'views/home_view.dart';
import 'package:bhbbites/widgets/provider_widget.dart';
import 'package:bhbbites/models/baby_prefrences.dart';


  class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  int _currentIndex =0;
  final List<Widget> _children = [
    BabyBioView(),
    //DashboardView(),
    //HomeView(),
    Recipepage(),
    Tipspage()
  ];

  @override
 Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Baby Healthy Bites"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print ("Signed Out");
              } catch (e) {
                print (e);
              }
            }
          )
        ]
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
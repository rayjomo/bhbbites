import 'dart:ui';
import 'package:flutter/material.dart';



class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    
    
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.menu_rounded), onPressed: (){},),
                      Text("Recipes", style: TextStyle(fontSize: 50, fontFamily: "Samantha"),
                      ),
                      IconButton(icon: Icon(Icons.person), onPressed: (){},)
                    ],
                  ),
                ),
                BannerWidgetArea()
              ],
            ),
          )
        ),
        
        
      ),
    );
  }
}



class BannerWidgetArea extends StatelessWidget {

  var bannerItems = ["Breakfast", "Lunch", "Dinner", "Desserts"];
  var bannerImage = [
    "images/burger.jpg",
    "images/cheesechilly.jpg",
    "images/noodles.jpg",
    "images/pizza.jpg"];

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller = PageController(initialPage: 1);

    List<Widget> banners = new List<Widget>();

    for(int x = 0; x < bannerItems.length; x++){
      var bannerView = Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(bannerImage[x], fit: BoxFit.cover,)
        ],
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: screenWidth,
      height: screenHeight * 9/16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),


    );
  }
}

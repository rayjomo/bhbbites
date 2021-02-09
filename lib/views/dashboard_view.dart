import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items = new List<Widget>();
      String dataString = await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      dataJSON.forEach((object) {

        String finalString= "";
        List<dynamic> dataList = object["placeItems"];
        dataList.forEach((item){
          finalString = finalString + item + " | ";
        });

        items.add(Padding(padding: EdgeInsets.all(2.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                BoxShadow(
                color: Colors.black12,
                spreadRadius: 2.0,
                blurRadius: 5.0
            ),
        ]
            ),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
            ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
          child: Image.asset(object["recipeImage"],width: 120,height: 120,fit: BoxFit.cover,),
        ),
          SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(object["recipeName"], style: TextStyle(fontSize: 20.0),),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0,bottom: 2.0),
                    child: Text(finalString,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 18.0,color: Colors.black54,),maxLines: 1,),
                  ),
                  Text("Age: ${object["age"]} months",style: TextStyle(fontSize: 17.0,color: Colors.black54),)
                ],
              ),
            ),
          )
          ],
            ),
        ),));
      });
        return items;
    }
    
    
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
                BannerWidgetArea(),

                Container(
        child: FutureBuilder(
        initialData: <Widget>[Text("")],
          future: createList(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: snapshot.data,
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),


    )


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
    "images/breakfast.jpg",
    "images/sweetpotato.jpg",
    "images/dinner.jpg",
    "images/dessert.jpg"];
  //var bannerdescription = [];

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller = PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = new List<Widget>();

    for(int x = 0; x < bannerItems.length; x++){
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
            child: Container(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[

                  //Add dropshadow
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                            spreadRadius: 1.0
                        )
                      ]
                    )
                  ),

                // Add curved edges
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular((20.0))),
                    child: Image.asset(
                      bannerImage[x],
                      fit: BoxFit.cover
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent,Colors.black])
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(bannerItems[x],
                          style: TextStyle(fontSize: 20.0, color: Colors.white),),
                      Text("More than 40% Off", style: TextStyle(fontSize: 18.0, color: Colors.white),)
                    ],
                  ),
                )

        ],
      ),
    ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: screenWidth,
      height: screenWidth * 9/16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),


    );
  }
}

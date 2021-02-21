import 'package:bhbbites/models/baby_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodPrefView extends StatelessWidget {
  final db = Firestore.instance;
  final BabyPrefrences babypref;
  FoodPrefView({Key key, @required this.babypref}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _allergiesController = new TextEditingController();
    TextEditingController _foodController = new TextEditingController();
    _allergiesController.text = babypref.allergies;
    _foodController.text = babypref.foodPrefrences;

    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text("Enter Your Baby's Allergies"),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: _allergiesController,
              autofocus: true,
            ),
          ),
          Text("Enter Foods Your Baby Loves"),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
                controller: _foodController),
          ),
          RaisedButton(
            //save data to firebase
            child: Text("Finish"),
            onPressed: () async {
              babypref.allergies = _allergiesController.text;
              babypref.foodPrefrences = _foodController.text;

              await db.collection("babyprefrences").add(babypref.toJson()

              );

              print(babypref.birthDate);
              print(babypref.gender);
              print(babypref.allergies);
              print(babypref.foodPrefrences);





              Navigator.of(context).popUntil((route) => route.isFirst);

            },
          )
        ])));
  }
}

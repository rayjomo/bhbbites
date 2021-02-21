import 'package:bhbbites/models/baby_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:bhbbites/views/baby_prefrences/foodpref_view.dart';

class BabyBioView extends StatelessWidget {
  final BabyPrefrences babypref;
  BabyBioView({Key key, @required this.babypref}) : super(key: key);


@override
Widget build(BuildContext context) {
  final newBabyPreferences = new BabyPrefrences(null, null, null, null);

  //TextEditingController _dateController = new TextEditingController();
  TextEditingController _genderController = new TextEditingController();
  //_dateController.text = newBabyPreferences.birthDate;
  _genderController.text = newBabyPreferences.gender;

  return Scaffold(
      body: Center(
          child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Enter Baby's Date of Birth"),
      // Padding(
      //   padding: const EdgeInsets.all(30.0),
      //   child: TextField(
      //     controller: _dateController,
      //     autofocus: true,
      //   ),
      // ),
      Text("Gender"),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: TextField(
          controller: _genderController,
          autofocus: true,
        ),
      ),

      RaisedButton(
        child: Text("Continue"),
        onPressed: () {
          //newBabyPreferences.birthDate = _dateController.text;
          newBabyPreferences.birthDate = DateTime.now();
          newBabyPreferences.gender = _genderController.text;

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FoodPrefView(babypref: newBabyPreferences ))
          );
        },
      ),
    ],
  )));
}
}

import 'package:bhbbites/models/baby_prefrences.dart';
import 'package:flutter/material.dart';


class BabyBioView extends StatelessWidget {

  final BabyPrefrences babypref;
  BabyBioView({Key key, @required this.babypref}) : super(key: key);
}
  @override
  Widget build(BuildContext context) {

    TextEditingController _titleController = new TextEditingController();


    return Scaffold(
        body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text("Enter Baby's Date of Birth"),
    Padding(
    padding: const EdgeInsets.all(30.0),
    child: TextField(
    controller: _titleController,
    autofocus: true,
    ),
    ),
    RaisedButton(
    child: Text("Continue"),
    onPressed: () {
    trip.title = _titleController.text;
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewTripDateView(trip: trip)),
    );
  }
}

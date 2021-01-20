import 'package:flutter/material.dart';
import 'recipe.dart';

class HomeView extends StatelessWidget {
  final List<Recipe> recipeList = [
    Recipe("Banana Puree", "6 months", "Breakfast"),
    Recipe("Sweet Potato Puree", "6 months", "Breakfast"),
    Recipe("Bread Fingers", "12 months", "Breakfast"),
    Recipe("Sweet Potato Smoothie", "6 months", "Smoothie"),
    Recipe("Cereal Pancakes", "8 months", "Breakfast"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: recipeList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildRecipeCard(context, index)),
    );
  }

  Widget buildRecipeCard(BuildContext context, int index) {
    final recipe = recipeList[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Text(recipe.recipeName, style: new TextStyle(fontSize: 30.0), ),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                child: Row(
                  children: <Widget>[
                    Text(recipe.age),
                    Spacer(),
                    Text(recipe.category),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

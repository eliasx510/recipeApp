import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/recipe.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  int recipeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecipeTemplate(
        recipe: Constants.recipeList[recipeIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(
          () => recipeIndex == Constants.recipeList.length - 1
              ? recipeIndex = 0
              : recipeIndex++,
        ),
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}

class RecipeTemplate extends StatelessWidget {
  final Recipe recipe;

  const RecipeTemplate({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleText = Text(
      recipe.name,
      style: const TextStyle(fontSize: 20),
    );

    Widget reviewRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            for (int i = 0; i < 5; i++)
              i < recipe.rating.stars
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border),
          ],
        ),
        Text(
          '${recipe.numReviews} Reviews',
        ),
      ],
    );

    Widget statsRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(
              Icons.check_box,
              color: Theme.of(context).primaryColor,
            ),
            const Text('PREP:'),
            Text(recipe.prepTime),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.lock_clock,
              color: Theme.of(context).primaryColor,
            ),
            const Text('COOK:'),
            Text(recipe.cookTime),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.android,
              color: Theme.of(context).primaryColor,
            ),
            const Text('FEEDS:'),
            Text(recipe.numPortions),
          ],
        ),
      ],
    );

    Widget bodyText = Text(
      recipe.description,
      textAlign: TextAlign.center,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Image.network(
            recipe.imageURL,
            fit: BoxFit.fitHeight,
          ),
          flex: 4,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              children: [
                titleText,
                const SizedBox(
                  height: 15,
                ),
                reviewRow,
                const SizedBox(
                  height: 20,
                ),
                statsRow,
                const SizedBox(
                  height: 10,
                ),
                bodyText,
              ],
            ),
          ),
          flex: 4,
        ),
      ],
    );
  }
}

import 'package:untitled/utils.dart';

class Recipe {
  final String name;
  final Rating rating;
  final int numReviews;
  final String prepTime;
  final String cookTime;
  final String numPortions;
  final String description;
  final String imageURL;

  const Recipe({
    required this.name,
    required this.rating,
    required this.numReviews,
    required this.prepTime,
    required this.cookTime,
    required this.numPortions,
    required this.description,
    required this.imageURL,
  });
}
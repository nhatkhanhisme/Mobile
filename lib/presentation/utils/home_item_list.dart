import 'package:flutter/widgets.dart';
import 'package:lacquer/config/theme.dart';

class HomeItemModel {
  final String imagePath;
  final String title;
  final Color backgroundColor;

  HomeItemModel({
    required this.imagePath,
    required this.title,
    required this.backgroundColor,
  });
}

final List<HomeItemModel> homeItems = [
  HomeItemModel(
    imagePath: "assets/images/flashcardLogo.png",
    title: "Flashcard",
    backgroundColor: Color(0xFF274874),
  ),
  HomeItemModel(
    imagePath: "assets/images/translatorLogo.png",
    title: "Translator",
    backgroundColor: CustomTheme.secondaryColor,
  ),
  HomeItemModel(
    imagePath: "assets/images/dictionaryLogo.png",
    title: "Dictionary",
    backgroundColor: Color(0xFFC8872B),
  ),
  HomeItemModel(
    imagePath: "assets/images/flashcardLogo.png",
    title: "Quiz",
    backgroundColor: Color(0xFFCD5036),
  ),
];

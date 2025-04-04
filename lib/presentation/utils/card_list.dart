import 'package:flutter/material.dart';

class FlashcardTopicModel {
  final Color backgroundColor;
  final String title;
  final int cardCount;
  final String imagePath;

  const FlashcardTopicModel({
    required this.backgroundColor,
    required this.title,
    required this.cardCount,
    required this.imagePath,
  });
}

final List<FlashcardTopicModel> cuisine = [
  FlashcardTopicModel(
    backgroundColor: Colors.white,
    title: "Luna New Year Cuisine",
    cardCount: 10,
    imagePath: "assets/images/mamCom.jpg",
  ),

  FlashcardTopicModel(
    backgroundColor: Colors.white,
    title: "Breakfast",
    cardCount: 12,
    imagePath: "assets/images/mamCom.jpg",
  ),

  FlashcardTopicModel(
    backgroundColor: Colors.white,
    title: "Cakes and Pastries",
    cardCount: 15,
    imagePath: "assets/images/mamCom.jpg",
  ),
];

final List<FlashcardTopicModel> animal = [
  FlashcardTopicModel(
    backgroundColor: Colors.white,
    title: "Luna New Year Cuisine",
    cardCount: 10,
    imagePath: "assets/images/mamCom.jpg",
  ),

  FlashcardTopicModel(
    backgroundColor: Colors.white,
    title: "Street foods",
    cardCount: 12,
    imagePath: "assets/images/mamCom.jpg",
  ),
];

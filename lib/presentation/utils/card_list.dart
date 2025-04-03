import 'package:flutter/material.dart';

class CustomCardModel {
  final Color backgroundColor;
  final String title;
  final int cardCount;
  final String imagePath;

  const CustomCardModel({
    required this.backgroundColor,
    required this.title,
    required this.cardCount,
    required this.imagePath,
  });
}

final List<CustomCardModel> cuisine = [
  CustomCardModel(
    backgroundColor: Colors.white,
    title: "Luna New Year Cuisine",
    cardCount: 10,
    imagePath: "assets/images/mamCom.jpg",
  ),

  CustomCardModel(
    backgroundColor: Colors.white,
    title: "Breakfast",
    cardCount: 12,
    imagePath: "assets/images/mamCom.jpg",
  ),

  CustomCardModel(
    backgroundColor: Colors.white,
    title: "Cakes and Pastries",
    cardCount: 15,
    imagePath: "assets/images/mamCom.jpg",
  ),
];

final List<CustomCardModel> animal = [
  CustomCardModel(
    backgroundColor: Colors.white,
    title: "Luna New Year Cuisine",
    cardCount: 10,
    imagePath: "assets/images/mamCom.jpg",
  ),

  CustomCardModel(
    backgroundColor: Colors.white,
    title: "Street foods",
    cardCount: 12,
    imagePath: "assets/images/mamCom.jpg",
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lacquer/config/theme.dart';

class CustomCardModel {
  final double width;
  final double height;
  final Color backgroundcolor;
  final double borderRadius;
  final double elevation;
  final String title;
  final int cardCount;

  const CustomCardModel({
    this.width = 100,
    this.height = 100,
    this.borderRadius = 20,
    this.elevation = 5,
    required this.backgroundcolor,
    required this.title,
    required this.cardCount,
  });
}

final List<CustomCardModel> cuisine = [
  CustomCardModel(
    backgroundcolor: CustomTheme.lightbeige,
    title: "Luna New Year Cuisine",
    cardCount: 10,
  ),

  CustomCardModel(
    backgroundcolor: CustomTheme.lightbeige,
    title: "Street foods",
    cardCount: 12,
  ),

  CustomCardModel(
    backgroundcolor: CustomTheme.lightbeige,
    title: "Luna New Year Cuisine",
    cardCount: 15,
  ),

  CustomCardModel(
    backgroundcolor: CustomTheme.lightbeige,
    title: "Luna New Year Cuisine",
    cardCount: 7,
  ),
];

final List<CustomCardModel> animal = [
  CustomCardModel(
    backgroundcolor: CustomTheme.lightbeige,
    title: "Luna New Year Cuisine",
    cardCount: 10,
  ),

  CustomCardModel(
    backgroundcolor: CustomTheme.lightbeige,
    title: "Street foods",
    cardCount: 12,
  ),
];

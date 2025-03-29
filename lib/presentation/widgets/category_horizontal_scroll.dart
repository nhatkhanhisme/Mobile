import 'package:flutter/material.dart';
import 'package:lacquer/presentation/widgets/category_card.dart';
import 'package:lacquer/features/auth/data/card_list.dart';

class HorizontalList extends StatelessWidget {
  final List<CustomCardModel> cards;

  const HorizontalList({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        padding: EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, _) => SizedBox(width: 12),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return CustomCard(
            backgroundcolor: cards[index].backgroundcolor,
            title: cards[index].title,
            cardCount: cards[index].cardCount,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lacquer/config/theme.dart';
import 'package:lacquer/features/auth/data/home_item_list.dart';
import 'package:lacquer/presentation/widgets/bottom_nav_bar.dart';
import 'package:lacquer/presentation/widgets/home_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.lightbeige,
      appBar: AppBar(
        backgroundColor: CustomTheme.cinnabar,
        title: const Text('Home Screen'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: homeItems.length,
          itemBuilder: (context, index) {
            return HomeItem(
              imagePath: homeItems[index].imagePath,
              title: homeItems[index].title,
              backgroundColor: homeItems[index].backgroundColor,
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
    );
  }
}

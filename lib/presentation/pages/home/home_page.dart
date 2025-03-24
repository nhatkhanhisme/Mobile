import 'package:flutter/material.dart';
import 'package:lacquer/presentation/widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Button Pressed!')));
          },

          child: const Text('Press me'),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
    );
  }
}

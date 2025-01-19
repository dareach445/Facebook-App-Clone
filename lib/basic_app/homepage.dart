import 'package:facebookapp_clone/components/Home/buttom_app_bar.dart';
import 'package:facebookapp_clone/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBarScreen(),
      body: HomeScreen(), // Dynamically changes based on _selectedIndex
      bottomNavigationBar: BottomAppBarDemo(), // Bottom navigation
    );
  }
}

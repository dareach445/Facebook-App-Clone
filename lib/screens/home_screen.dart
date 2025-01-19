import 'package:facebookapp_clone/components/Home/main_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: const AppBarScreen(),
      body: MainListView(), // Dynamically changes based on _selectedIndex
    );
  }
}
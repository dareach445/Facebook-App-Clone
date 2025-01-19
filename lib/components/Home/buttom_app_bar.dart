import 'package:flutter/material.dart';

import '../../screens/friends_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/marketplace_screen.dart';
import '../../screens/notifications_screen.dart';
import '../../screens/video_screen.dart';
import '../../screens/menu_screen.dart'; // Make sure this is the correct path to your MenuScreen

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({super.key});

  @override
  State<BottomAppBarDemo> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomAppBarDemo> {
  int _selectedIndex = 0;
  bool isDarkMode = false; // Track the current theme mode

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode; // Toggle the theme mode
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const HomeScreen(),
      const VideoScreen(),
       FriendsScreen(
        isDarkMode: isDarkMode,
        onToggleTheme: toggleTheme,
      ),
      const MarketplaceScreen(),
      NotificationsPage(
        isDarkMode: isDarkMode,
        toggleTheme: toggleTheme,
      ),
      MenuScreen(
        isDarkMode: isDarkMode,
        onToggleTheme: toggleTheme, // Pass the toggleTheme function
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Theme mode
      home: Scaffold(
        body: _pages[_selectedIndex], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index; // Update the index to switch screens
            });
          },
          backgroundColor: isDarkMode ? Colors.grey[850] : Colors.grey[100],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: isDarkMode ? Colors.white : Colors.blue,
          unselectedItemColor: isDarkMode ? Colors.grey : Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Marketplace',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}

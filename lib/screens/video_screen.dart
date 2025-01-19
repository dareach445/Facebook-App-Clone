import 'package:facebookapp_clone/components/Videos/appbar.dart';
import 'package:facebookapp_clone/components/Videos/main_screen.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  bool isDarkMode = false; // Manage dark mode state

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode; // Toggle the theme
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBarVDScreen(
        isDarkMode: isDarkMode,
        onToggleTheme: toggleTheme,
      ),
      body: const MainViewScreen(),
    );
  }
}

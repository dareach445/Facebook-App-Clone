import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Track the theme mode

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode; // Toggle the theme
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _isDarkMode ? Colors.black : Colors.white, // Toggle background color
        appBar: AppBarVDScreen(
          isDarkMode: _isDarkMode,
          onToggleTheme: _toggleTheme,
        ),
        body: Center(
          child: Text(
            "Hello, world!",
            style: TextStyle(
              color: _isDarkMode ? Colors.white : Colors.black, // Toggle text color
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarVDScreen extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode; // Track the theme mode
  final VoidCallback onToggleTheme; // Function to toggle the theme

  const AppBarVDScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // Toggle AppBar background
      title: Padding(
        padding: const EdgeInsets.only(top: 20.0), // Add top padding for the title
        child: Row(
          children: [
            Text(
              "Videos",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black, // Toggle title text color
              ),
            ),
            const Spacer(),
            Icon(
              Icons.person,
              size: 40,
              color: isDarkMode ? Colors.white : Colors.black, // Toggle icon color
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.search,
              size: 40,
              color: isDarkMode ? Colors.white : Colors.black, // Toggle icon color
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: isDarkMode ? Colors.yellow : Colors.black, // Toggle mood icon color
              ),
              onPressed: onToggleTheme, // Call the toggle theme function
            ),
          ],
        ),
      ),
      toolbarHeight: 80, // Set the height of the AppBar
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}

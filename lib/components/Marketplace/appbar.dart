import 'package:flutter/material.dart';

class AppBarMKSreen extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode; // Add dark mode flag

  const AppBarMKSreen({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // Dynamic background
      title: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Row(
          children: [
            Text(
              "Marketplace",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black, // Dynamic text color
              ),
            ),
            const Spacer(),
            Icon(
              Icons.person,
              size: 40,
              color: isDarkMode ? Colors.white : Colors.black, // Dynamic icon color
            ),
            Icon(
              Icons.search,
              size: 40,
              color: isDarkMode ? Colors.white : Colors.black, // Dynamic icon color
            ),
          ],
        ),
      ),
      toolbarHeight: 80,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90.0);
}

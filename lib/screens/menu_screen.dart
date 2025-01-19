import 'package:facebookapp_clone/basic_app/basic_app.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; // Track the current theme mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Theme mode
      home: MenuScreen(
        onToggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode; // Toggle the theme mode
          });
        },
        isDarkMode: isDarkMode,
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final VoidCallback onToggleTheme; // Callback for toggling theme
  final bool isDarkMode;

  const MenuScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30.0),
      child: Scaffold(
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.grey[200],
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          elevation: 0,
          title: Text(
            'Menu',
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          actions: [
            IconButton(
              icon: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              onPressed: onToggleTheme,
            ),
            IconButton(
              icon: Icon(Icons.search,
                  color: isDarkMode ? Colors.white : Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info Section
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[800] : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: isDarkMode
                          ? Colors.black54
                          : Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/profile_mind.webp'),
                      // backgroundColor:
                      //     isDarkMode ? Colors.grey[700] : Colors.grey[300],
                      // child: Icon(Icons.person,
                      //     size: 30,
                      //     color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Dareach Ren',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.refresh,
                          color: isDarkMode ? Colors.white : Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Shortcuts
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Your Shortcuts',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 100, // Increase the height
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    shortcutAvatar('Serey Bot Tiger', isDarkMode,
                        'https://i.pinimg.com/originals/f8/56/d8/f856d856911900e0ec2b4814ab8b6d22.jpg'),
                    shortcutAvatar('Phea Rom', isDarkMode,
                        'https://i.pinimg.com/originals/0c/18/ca/0c18ca145757cf03260ffa410abb5ff1.jpg'),
                    shortcutAvatar('Chhun En', isDarkMode,
                        'https://i.pinimg.com/originals/08/b2/32/08b232d767a21bcf947cf211f27eaed6.jpg'),
                    shortcutAvatar('Oudom Mon', isDarkMode,
                        'https://example.com/image4.jpg'),
                    shortcutAvatar('So Thea', isDarkMode,
                        'https://i.pinimg.com/736x/3e/5c/93/3e5c93f631307cbf779f0b593d6a4908--philippine-women--free.jpg'),
                    shortcutAvatar('Kei Ya', isDarkMode,
                        'https://th.bing.com/th/id/OIP.HFpwKE9v9WOc4X4b_Hij2wHaJO?rs=1&pid=ImgDetMain'),
                    shortcutAvatar('Mat Pha', isDarkMode,
                        'https://th.bing.com/th/id/R.498b6ae30835667139b36050a0e708d9?rik=VS9q6tspxvZouA&pid=ImgRaw&r=0'),
                    shortcutAvatar('Ly Na', isDarkMode,
                        'https://netstorage-kami.akamaized.net/images/d7b07055583275a4.jpg?imwidth=900'),
                  ],
                ),
              ),

              // Menu Items
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  menuItem(Icons.flag, 'Pages', isDarkMode),
                  menuItem(Icons.history, 'Memories', isDarkMode),
                  menuItem(Icons.bookmark, 'Saved', isDarkMode),
                  menuItem(Icons.group, 'Groups', isDarkMode),
                  menuItem(Icons.video_library, 'Video', isDarkMode),
                  menuItem(Icons.store, 'Marketplace', isDarkMode),
                  menuItem(Icons.people, 'Friends (70 online)', isDarkMode),
                  menuItem(Icons.feed, 'Feeds', isDarkMode),
                ],
              ),

              // "See More" Button
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDarkMode ? Colors.grey[800] : Colors.white,
                    foregroundColor: isDarkMode ? Colors.white : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: isDarkMode ? Colors.white54 : Colors.grey),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {},
                  child: const Center(child: Text('See more')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDarkMode ? Colors.grey[800] : Colors.grey[400],
                    foregroundColor: isDarkMode ? Colors.white : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: isDarkMode ? Colors.white54 : Colors.grey),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  BasicApp(),
                      ),
                    );
                  },
                  child: const Center(child: Text('Log Out')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shortcutAvatar(String name, bool isDarkMode, String imageUrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: imageUrl.isNotEmpty
              ? NetworkImage(imageUrl)
              : null, // Load image if URL is provided
          backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
          child: imageUrl.isEmpty
              ? Icon(Icons.person,
                  color: isDarkMode ? Colors.white : Colors.black)
              : null, // Fallback to icon if no image
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 70, // Constrain the width to prevent overflow
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis, // Truncate overflow text
            maxLines: 1, // Limit to a single line
          ),
        ),
      ],
    );
  }

  Widget menuItem(IconData icon, String title, bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
          const SizedBox(width: 8),
          Text(title,
              style:
                  TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
        ],
      ),
    );
  }
}

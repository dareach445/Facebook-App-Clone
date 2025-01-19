import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; // Track dark mode state

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: FriendsScreen(
        isDarkMode: isDarkMode,
        onToggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}

class FriendsScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const FriendsScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final List<Map<String, dynamic>> friendRequests = [
    {
      "name": "Alita",
      "mutualFriends": "1 mutual friend",
      "time": "3w",
      "avatar":
          "https://m.media-amazon.com/images/S/pv-target-images/a121447e98b5295b83d751f7abf91ad4fb0f780a66f10f4ebfaf70b45009da3b.jpg"
    },
    {
      "name": "Poo",
      "mutualFriends": "0 mutual friends",
      "time": "4w",
      "avatar":
          "https://th.bing.com/th/id/R.59b77191cc2458b501126cdb6e0e396c?rik=44sk42%2fFTfBhTg&pid=ImgRaw&r=0"
    },
    {
      "name": "You You",
      "mutualFriends": "11 mutual friends",
      "time": "1y",
      "avatar":
          "https://th.bing.com/th/id/OIP.NrzR5AxYhrfdVCiPnwkGWQHaHf?rs=1&pid=ImgDetMain"
    },
    {
      "name": "So Reach",
      "mutualFriends": "3 mutual friends",
      "time": "2y",
      "avatar":
          "https://th.bing.com/th/id/OIP.PBtbkYmXkuCPeYKEGKGAnwHaOF?rs=1&pid=ImgDetMain"
    },
    {
      "name": "Da Roth",
      "mutualFriends": "45 mutual friends",
      "time": "3w",
      "avatar":
          "https://th.bing.com/th/id/OIP.Xt578Z9I1BcQ25cA25jyyQAAAA?rs=1&pid=ImgDetMain"
    },
    {
      "name": "Reak Smey",
      "mutualFriends": "32 mutual friends",
      "time": "8w",
      "avatar":
          "https://th.bing.com/th/id/R.e148300cf8783f1b533a4e54c4e05dae?rik=J2lpHVQc5nHfkQ&pid=ImgRaw&r=0"
    },
    {
      "name": "Thi Da",
      "mutualFriends": "76 mutual friends",
      "time": "1w",
      "avatar":
          "https://th.bing.com/th/id/R.db9f999ff3c8d4d71dc9863c662f8d79?rik=TZQFvOJzXzgx9g&riu=http%3a%2f%2fbuzznigeria.com%2fwp-content%2fuploads%2f2016%2f05%2fm-abudu-0.jpg&ehk=axfxI1u%2bOlDmlxJziKQQ3VqwZNExu%2fBwSRFbETcCaJM%3d&risl=&pid=ImgRaw&r=0"
    },
    {
      "name": "Tola SA",
      "mutualFriends": "21 mutual friends",
      "time": "1y",
      "avatar":
          "https://th.bing.com/th/id/OIP.g99aMPEIFUIYVE1cJPSIYgHaLH?rs=1&pid=ImgDetMain"
    },
    {
      "name": "lY NA",
      "mutualFriends": "15 mutual friends",
      "time": "1y",
      "avatar":
          "https://netstorage-kami.akamaized.net/images/0fgjhs6sjo86rr53e.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Friends",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                        color: widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                      onPressed: widget.onToggleTheme,
                    ),
                    Icon(
                      Icons.search,
                      size: 40,
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: "64 Online"),
              Tab(text: "Suggestions"),
              Tab(text: "Your Friends"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Friend Requests",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: friendRequests.length,
                  itemBuilder: (context, index) {
                    final request = friendRequests[index];
                    return Card(
                      color: widget.isDarkMode ? Colors.grey[800] : Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(request['avatar']),
                        ),
                        title: Text(
                          request['name'],
                          style: TextStyle(
                            color: widget.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "${request['mutualFriends']} • ${request['time']}",
                          style: TextStyle(
                            color: widget.isDarkMode ? Colors.grey[300] : Colors.black54,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Confirmed ${request['name']}"),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text("Confirm"),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Deleted ${request['name']}"),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: widget.isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              child: const Text("Delete"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
